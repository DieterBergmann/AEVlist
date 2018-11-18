//
//  AEVListViewController.swift
//  AEVlist
//
//  Created by Dieter Bergmann on 15.11.18.
//  Copyright © 2018 Dieter Bergmann. All rights reserved.
//

import UIKit
import RealmSwift

class AEVListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Erzeugen relam Database und Auto-updating Container
    let realm = try! Realm()
    var projectData: Results<ProjectData>?

    // MARK: - IBOutlets
    @IBOutlet weak var projectTableView: UITableView!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register NotificationCenter
        NotificationCenter.default.addObserver(self, selector: #selector(updateProjectData), name: .updateProjectData, object: nil)
        
        // Set yourself as the delegate and datasource
        projectTableView.delegate = self
        projectTableView.dataSource = self
        
        // Register the ProjektCell.xib
        projectTableView.register(UINib(nibName: "ProjectCell", bundle: nil ), forCellReuseIdentifier: "projektCell")
        
        loadProjectData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        projectTableView.reloadData()
    }
    
    // MARK: - TableView Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectData?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projektCell", for: indexPath) as! ProjectCell
        
        
        cell.softwareCycle.text = projectData?[indexPath.row].softwareCycle
        cell.projectName.text = projectData?[indexPath.row].projectName
        
        return cell
    }
    
    // MARK: - TabelView Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Action Methods
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddProject", sender: self)
    }
    
    // MARK: - Own Functions
    func loadProjectData() {
        projectData = realm.objects(ProjectData.self)
        
        projectTableView.reloadData()
    }
    
    @objc func updateProjectData() {
        projectTableView.reloadData()
    }
}

// MARK: - Extensions
extension Notification.Name {
    static let updateProjectData = Notification.Name("updateProjectData")
}


