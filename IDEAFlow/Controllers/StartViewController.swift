//
//  StartViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit
import SwiftDate

class StartViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pastIdeasButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUserDefaults()
        setupNavigationController()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationController()
        updateMessageLabel()
        checkUser()
    }
    
    func setupNavigationController() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Zen Kaku Gothic New", size: 27)!, .foregroundColor: MyColor.shared.mainColor]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont(name: "Zen Kaku Gothic New", size: 35)!, .foregroundColor: MyColor.shared.mainColor]
        
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupButtons() {
        
        startButton.layer.cornerCurve = .continuous
        startButton.layer.cornerRadius = startButton.bounds.height / 2
        
        pastIdeasButton.layer.cornerCurve = .continuous
        pastIdeasButton.layer.cornerRadius = pastIdeasButton.bounds.height / 2
        pastIdeasButton.layer.borderColor = MyColor.shared.mainColor.cgColor
        pastIdeasButton.layer.borderWidth = 4
    }
    
    func setupUserDefaults() {
        
        UserDefaults.standard.register(defaults: ["lastPlayedDay": -100])
    }
    
    func updateNavigationController() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func updateMessageLabel() {
        
        let lastPlayedDay = UserDefaults.standard.integer(forKey: "lastPlayedDay")
        
        if (Date() + 9.hours).day == lastPlayedDay {
            
            messageLabel.text = "今日のプレイ：完了！"
        }else {
            
            messageLabel.text = "今日のプレイ：まだ"
        }
    }
    
    func checkUser() {
        
        guard let user = UserDefaults.standard.string(forKey: "user") else {
            
            performSegue(withIdentifier: "toAuthView", sender: nil)
            return
        }
        
        if user == "" {
            
            performSegue(withIdentifier: "toAuthView", sender: nil)
            return
        }
        
        FlowManager.shared.user = user
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        
        FlowManager.shared.reset()
        
        UserDefaults.standard.setValue((Date() + 9.hours).day, forKey: "lastPlayedDay")
        
        performSegue(withIdentifier: "toIdeaFlowView", sender: nil)
    }
    
    @IBAction func pastIdeasButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toPastIdeasView", sender: nil)
    }
}
