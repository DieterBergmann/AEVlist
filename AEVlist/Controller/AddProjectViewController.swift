//
//  AddProjectViewController.swift
//  AEVlist
//
//  Created by Dieter Bergmann on 15.11.18.
//  Copyright © 2018 Dieter Bergmann. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController {

    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var softwareCycleTextField: UITextField!
    
    var projectName: String = ""
    var softwareCycle: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func closePopup(_ sender: UIButton) {
        if let name = projectNameTextField.text {
           projectName = name
        print("projectName = \(projectName)")
        } else {
            print("No projectName added!")
        }
        
        if let cycle = softwareCycleTextField.text {
            softwareCycle = cycle
            print("softwareCycle = \(softwareCycle)")
        } else {
            print("No softwareCycle added! ")
        }

        dismiss(animated: true, completion: nil)
    }
    
}
