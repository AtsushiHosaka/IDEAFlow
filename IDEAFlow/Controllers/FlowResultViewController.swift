//
//  FlowResultViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit

class FlowResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func returnto() {
        
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func a(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
