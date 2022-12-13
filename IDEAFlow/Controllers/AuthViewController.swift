//
//  AuthViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/14.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
    }
    
    func setupButtons() {
        
        enterButton.layer.cornerCurve = .continuous
        enterButton.layer.cornerRadius = enterButton.bounds.height / 2
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        
        guard let name = nameTextField.text else { return }
        
        UserDefaults.standard.set(name, forKey: "user")
        
        dismiss(animated: true)
    }
    
}
