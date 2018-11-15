//
//  AEVListViewController.swift
//  AEVlist
//
//  Created by Dieter Bergmann on 15.11.18.
//  Copyright © 2018 Dieter Bergmann. All rights reserved.
//

import UIKit

class AEVListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let projectArray = ["NAG3-Classic", "NAG3-Mopf", "NAG3-Mopf", "NAG3-Mopf Hybrid NAG3-Mopf Hybrid NAG3-Mopf Hybrid NAG3-Mopf Hybrid "]
    let swCycle = ["18B", "18B", "19A", "19A"]


    @IBOutlet weak var projectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Set yourself as the delegate and datasource
        projectTableView.delegate = self
        projectTableView.dataSource = self
        
        // TODO: Register the ProjektCell.xib
        projectTableView.register(UINib(nibName: "ProjectCell", bundle: nil ), forCellReuseIdentifier: "projektCell")
    }
    
    // MARK - TableView Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projektCell", for: indexPath) as! ProjectCell
        
        
        cell.softwareCycle.text = swCycle[indexPath.row]
        cell.projectName.text = projectArray[indexPath.row]
        
        return cell
    }
    
    // MARK - TabelView Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

