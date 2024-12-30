//
//  SettingsViewController.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import UIKit

class OnboardingViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var gradientMainLabel: UILabel!
    
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
        let gradientColors = [UIColor(hexString: "#3C9548"), UIColor(hexString: "#BAD1FA"),UIColor(hexString: "#3C9548")]
        let gradient = UIColor.getGradientLayer(bounds: self.gradientMainLabel.bounds, colors: gradientColors)
        self.gradientMainLabel.textColor = UIColor.gradientColor(bounds: self.gradientMainLabel.bounds, gradientLayer: gradient)
    }
    
    
    @IBAction func didTapImportWalletButton(_ sender: Any) {
        
    }
    
    @IBAction func didTapCreateWalletButton(_ sender: Any) {
        self.coordinator?.navigateTo(to: .createWallet, with: nil)
    }
    
}
