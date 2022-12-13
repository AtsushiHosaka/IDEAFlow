//
//  IdeaFlowViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit

class IdeaFlowViewController: UIViewController {
    
    let flowManager = FlowManager.shared
    
    var timer: Timer!
    
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var componentLabel1: UILabel!
    @IBOutlet weak var componentLabel2: UILabel!
    @IBOutlet weak var comeUpButton: UIButton!
    @IBOutlet weak var ideasCounterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupButtons()
        setupLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nextFlow()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
    }
    
    func setupNavigationController() {
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func setupButtons() {
        
        comeUpButton.layer.cornerCurve = .continuous
        comeUpButton.layer.cornerRadius = comeUpButton.bounds.height / 2
    }
    
    func setupLabels() {
        
        ideasCounterLabel.layer.cornerRadius = ideasCounterLabel.bounds.height / 2
        ideasCounterLabel.clipsToBounds = true
    }
    
    func resetTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "中断", message: "中断するとこれまでの記録は消えます", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
            
            UserDefaults.standard.setValue(-100, forKey: "lastPlayedDay")
            self.navigationController?.popViewController(animated: true)
        })
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    @IBAction func multiplyButtonPressed(_ sender: Any) {
        
        updateComponents()
    }
    
    @IBAction func comeUpButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toInputIdeaView", sender: nil)
    }
    
    func nextFlow() {
        
        if flowManager.ideas.count < flowManager.ideasRimit {
            
            resetTimer()
            updateComponents()
            updateUI()
        }else {
            
            performSegue(withIdentifier: "toFlowResultView", sender: nil)
        }
    }
    
    @objc func updateTimer() {
        
        flowManager.updateTimer()
        
        if flowManager.timeRimit - flowManager.currentTime < 0 {
            
            endFlow()
        }else {
            
            updateUI()
        }
    }
    
    func updateUI() {
        
        self.title = flowManager.getCurrentTimeText()
        
        ideasCounterLabel.text = "\(flowManager.ideas.count)/\(flowManager.ideasRimit)"
    }
    
    func updateComponents() {
        
        flowManager.getComponentsPair()
        
        componentLabel1.text = flowManager.currentComponents.component1
        componentLabel2.text = flowManager.currentComponents.component2
    }
    
    func endFlow() {
        
        performSegue(withIdentifier: "toFlowResultView", sender: nil)
    }
}
