//
//  WordData.swift
//  IDEAFlow
//
//  Created by Kyoya Yamaguchi on 2023/10/15.
//

import Foundation

enum WordCategory {
    case noun
    
    var fileName: String {
        switch self {
        case .noun:
            "Noun"
        }
    }
}

struct WordData {
    var category: WordCategory
    var word: String
}
