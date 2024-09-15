//
//  SettingsViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class SettingsViewController: UIViewController, Storyboarded {
    
    var coordinator: SettingsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Settings"
    }
    
}
