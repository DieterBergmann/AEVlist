//
//  AddProjectViewController.swift
//  AEVlist
//
//  Created by Dieter Bergmann on 15.11.18.
//  Copyright © 2018 Dieter Bergmann. All rights reserved.
//

import UIKit
import RealmSwift

class AddProjectViewController: UIViewController {

    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var softwareCycleTextField: UITextField!
    
    // Erzeugen eines neuen realm Database Objektes
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePopup(_ sender: UIButton) {
        
        let newProjectData = ProjectData()
        
        if let name = projectNameTextField.text, let cycle = softwareCycleTextField.text {
            newProjectData.projectName = name
            newProjectData.softwareCycle = cycle
            print("projectName = \(newProjectData.projectName)")
            print("softwareCycle = \(newProjectData.softwareCycle)")
            save(projectData: newProjectData)
        } else {
            print("No projectName or softwareCycle added!")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func save(projectData: ProjectData) {
        do {
            // Übergeben von Änderungen an Realm
            try realm.write {
                realm.add(projectData)
            }
        } catch {
            print("Error saving projectData \(error)")
        }
        
        // TableView aktualisieren
        NotificationCenter.default.post(name: .updateProjectData, object: nil)

    }
    
}

