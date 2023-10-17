//
//  CSVManager.swift
//  IDEAFlow
//
//  Created by Kyoya Yamaguchi on 2023/10/15.
//

import Foundation

class CSVManager {
    
    static let shared = CSVManager()
    
    private init() {}
    
    func parseCSV(wordCategory: WordCategory) -> [WordData] {
        var entries: [WordData] = []
        
        guard let csvData = readCSVFile(fileName: wordCategory.fileName) else { return [] }
        let lines = csvData.split(separator: "\n")
        for line in lines {
            let components = line.split(separator: ",")
            let word = String(components[0])
            let entry = WordData(category: wordCategory, word: word)
            entries.append(entry)
        }
        
        return entries
    }
    
    private func readCSVFile(fileName: String) -> String? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "csv") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let encodedString = String(data: data, encoding: .japaneseEUC)
            return encodedString
        } catch {
            print("Error reading the CSV file: \(error.localizedDescription)")
            return nil
        }
    }
}
