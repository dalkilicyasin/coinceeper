//
//  SettingsViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class SplashViewController: UIViewController, Storyboarded {
    
    var coordinator: SplashCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Settings"
    }
    
}
