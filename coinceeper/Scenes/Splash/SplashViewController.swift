//
//  SettingsViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class SplashViewController: UIViewController, Storyboarded {
    
    var splashViewModel: SplashViewModel?
    var coordinator: SplashCoordinator?
    
    init(splashViewModel: SplashViewModel) {
        self.splashViewModel = splashViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.splashViewModel = .init(splashRepository: SplashNetworkService())
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapImportWalletButton(_ sender: Any) {
        
    }
    
    @IBAction func didTapCreateWalletButton(_ sender: Any) {
        self.coordinator?.navigateTo(to: .createWallet, with: nil)
    }
    
}
