//
//  FlowResultViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit

class FlowResultViewController: UIViewController {
    
    let flowManager = FlowManager.shared

    @IBOutlet weak var topButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
        setupTablevView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    func setupButtons() {
        
        //font設定
    }
    
    func setupTablevView() {
        
        tableView.dataSource = self
        tableView.delegate = self
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
        
        cell.textLabel!.text = "\(flowManager.ideas[indexPath.row].component1)×\(flowManager.ideas[indexPath.row].component2)"
        cell.detailTextLabel?.text = "\(flowManager.ideas[indexPath.row].date)"
        
        return cell
    }
    
    
}

extension FlowResultViewController: UITableViewDelegate {
    
    
}
