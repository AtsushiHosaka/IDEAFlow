//
//  FlowResultViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit

class FlowResultViewController: UIViewController {
    
    let flowManager = FlowManager.shared

    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
        setupTablevView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        uploadIdeas()
        tableView.reloadData()
    }
    
    func setupButtons() {
        
        topButton.layer.cornerCurve = .continuous
        topButton.layer.cornerRadius = topButton.bounds.height / 2
    }
    
    func setupTablevView() {
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func uploadIdeas() {
        
        guard let user = UserDefaults.standard.string(forKey: "user") else {
            return
        }
        
        for idea in flowManager.ideas {
            
            FirebaseAPI.shared.upload(user: user, idea: idea)
        }
    }
    
    @IBAction func topButtonPressed(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension FlowResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return flowManager.ideas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        
        config.text = "\(flowManager.ideas[indexPath.row].component1)×\(flowManager.ideas[indexPath.row].component2)"
        config.secondaryText = "\(flowManager.ideas[indexPath.row].date)"
        
        config.textProperties.font = UIFont(name: "Zen Kaku Gothic New", size: 27)!
        config.secondaryTextProperties.font = UIFont(name: "Zen Kaku Gothic New", size: 14)!
        
        cell.contentConfiguration = config
        
        return cell
    }
}

extension FlowResultViewController: UITableViewDelegate {
    
    
}
