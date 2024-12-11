//
//  CreatetWalletViewController.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 10.12.2024.
//

import UIKit

class CreateWalletViewController: UIViewController, Storyboarded {
    
    //MARK: - IBOutlets
    @IBOutlet weak var walletNameTextField: CustomUITextField!
    
    var createWalletViewModel: CreateWalletViewModel?
    var coordinator: CreateWalletCoordinator?
    
    init(viewModel: CreateWalletViewModel? = nil) {
        self.createWalletViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.createWalletViewModel = CreateWalletViewModel.init(splashRepository: SplashNetworkService())
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func createWalletButtonTapped(_ sender: Any) {
        self.createWalletViewModel?.createWalletRequestModel.Password = "1234512345112141"
        self.createWalletViewModel?.createWalletRequestModel.WalletName = "mohammad"
        
        self.createWalletViewModel?.createWallet()
    }
    
}

extension CreateWalletViewController: CreateWalletViewModelDelegate {
    func createWalletSuccess() {
        print("to passcode")
        self.coordinator?.navigateTo(to: .toPassCodePage, with: nil)
    }
}
