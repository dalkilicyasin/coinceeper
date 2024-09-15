//
//  SwapViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class SwapViewController: UIViewController, Storyboarded {
    
    var coordinator: SwapCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Swap"
    }
}
