//
//  StartViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pastIdeasButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationController()
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
    
    func updateNavigationController() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func checkUser() {
        
        guard let user = UserDefaults.standard.string(forKey: "user") else {
            
            performSegue(withIdentifier: "toAuthView", sender: nil)
            return
        }
        
        FlowManager.shared.user = user
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toIdeaFlowView", sender: nil)
    }
    
    @IBAction func pastIdeasButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toPastIdeasView", sender: nil)
    }
}
