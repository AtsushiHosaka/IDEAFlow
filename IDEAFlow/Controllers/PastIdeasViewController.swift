//
//  PastIdeasViewController.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/13.
//

import UIKit

class PastIdeasViewController: UIViewController {
    
    var ideas = [Idea]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationController()
        getIdeasFromFirebase()
    }
    
    func setupNavigationController() {
        
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateNavigationController() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getIdeasFromFirebase() {
        
        guard let user = UserDefaults.standard.string(forKey: "user") else {
            
            return
        }
        FirebaseAPI.shared.getDatas(user: user, completionHandler: { ideas in
            
            self.ideas = ideas
            self.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toIdeaView" {
            
            let ideaView = segue.destination as! IdeaViewController
            
            ideaView.idea = sender as? Idea
        }
    }

}

extension PastIdeasViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ideas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        
        config.text = "\(ideas[indexPath.row].component1)×\(ideas[indexPath.row].component2)"
        config.secondaryText = "\(ideas[indexPath.row].date)"
        
        config.textProperties.font = UIFont(name: "Zen Kaku Gothic New", size: 27)!
        config.secondaryTextProperties.font = UIFont(name: "Zen Kaku Gothic New", size: 14)!
        
        cell.contentConfiguration = config
        
        return cell
    }
}

extension PastIdeasViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toIdeaView", sender: ideas[indexPath.row])
    }
}
