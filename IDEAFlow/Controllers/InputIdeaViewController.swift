//
//  InputIdeaViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit
import SwiftDate

class InputIdeaViewController: UIViewController {
    
    let flowManager = FlowManager.shared
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextViews()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    func setupTextViews() {
        
        descriptionTextView.layer.borderColor = MyColor.shared.mainColor.cgColor
        descriptionTextView.layer.borderWidth = 3
    }
    
    func setupButtons() {
        
        saveButton.layer.cornerCurve = .continuous
        saveButton.layer.cornerRadius = saveButton.bounds.height / 2
    }
    
    func updateUI() {
        
        self.title = flowManager.getComponentsText()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let description = descriptionTextView.text else {
            
            let alertController = UIAlertController(title: "説明を入力してください", message: "", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            alertController.addAction(okAction)
            
            present(alertController, animated: true)
            return
        }
        
        flowManager.ideas.append(Idea(component1: flowManager.currentComponents.component1,
                                      component2: flowManager.currentComponents.component2,
                                      description: description,
                                      date: Date() + 9.hours))
        
        self.navigationController?.popViewController(animated: true)
    }
}
