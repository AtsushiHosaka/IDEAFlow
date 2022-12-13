//
//  IdeaViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit

class IdeaViewController: UIViewController {
    
    var idea: Idea?

    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTitle()
        updateDescriptionTextView()
    }
    
    func setupTextView() {
        
//        descriptionTextView.layer.borderColor = MyColor.shared.mainColor.cgColor
//        descriptionTextView.layer.borderWidth = 3
        descriptionTextView.isUserInteractionEnabled = false
    }
    
    func updateTitle() {
        
        if let idea = idea {
            
            self.title = "\(idea.component1)×\(idea.component2)"
        }else {
            
            self.title = ""
        }
    }
    
    func updateDescriptionTextView() {
        
        if let idea = idea {
            
            descriptionTextView.text = idea.description
        }else {
            
            descriptionTextView.text = ""
        }
    }

}
