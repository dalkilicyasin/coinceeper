//
//  ScanViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class ScanViewController: UIViewController, Storyboarded {
    
    var coordinator: ScanCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Scan"
    }
}
