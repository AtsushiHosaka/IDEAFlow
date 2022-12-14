//
//  FlowManager.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import Foundation

class FlowManager {
    
    static let shared = FlowManager()
    
    var user = ""
    
    var ideasRimit = 3
    var ideas = [Idea]()
    
    let timeRimit = 60
    var currentTime: Int = 0
    
    let components_functions = ["カメラ", "画像認識", "メモ", "AR", "VR", "時計", "アラーム", "カレンダー", "ストップウォッチ", "地図", "天気", "位置情報", "加速度センサー", "明るさセンサー", "ライト", "通話", "電卓", "AI", "キーボード", "通知"]
    let components_consepts = ["単語学習", "勉強", "SNS", "運動", "ゲーム", "リマインダー", "時間割", "宿題", "チャット", "ノート", "散歩", "スポーツ", "服装", "タイピング", "睡眠", "砂時計", "音楽", "プレイリスト", "食事", "買い物", "プログラミング", "部活", "おかね", "読書", "公園", "電車", "黒板", "空", "星座", "文化", "デザイン", "映え"]
    var currentComponents = (component1: "", component2: "")
    
    func getComponentsPair() {
        
        currentComponents = (components_functions.randomElement() ?? "", components_consepts.randomElement() ?? "")
    }
    
    func reset() {
        
        currentTime = 0
        ideas = [Idea]()
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
