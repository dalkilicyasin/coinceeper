//
//  WalletViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class WalletViewController: UIViewController, Storyboarded {
    
    var coordinator: WalletCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Wallet"
    }

}
