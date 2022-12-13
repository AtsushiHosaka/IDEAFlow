//
//  FlowManager.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import Foundation

class FlowManager {
    
    static let shared = FlowManager()
    
    var ideasRimit = 1
    var ideas = [Idea]()
    
    let timeRimit = 180
    var currentTime: Int = 0
    
    let components_functions = ["カメラ", "画像認識", "メモ", "AR", "VR"]
    let components_consepts = ["単語学習", "勉強", "SNS", "運動", "ゲーム"]
    var currentComponents = (component1: "", component2: "")
    
    func getComponentsPair() {
        
        currentComponents = (components_functions.randomElement() ?? "", components_consepts.randomElement() ?? "")
    }
    
    func updateTimer() {
        
        currentTime += 1
    }
    
    func getCurrentTimeText() -> String {
        
        let lastTime = timeRimit - currentTime
        return "\(lastTime / 60):\(String(format: "%02d", lastTime % 60))"
    }
    
    func getComponentsText() -> String {
        
        return "\(currentComponents.component1)×\(currentComponents.component2)"
    }
}
