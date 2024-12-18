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
    @IBOutlet weak var newPasswordTextField: CustomUITextField!
    @IBOutlet weak var confirmPasswordTextField: CustomUITextField!
    
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
        self.createWalletViewModel?.delegate = self
        self.prepareViews()
    }
    
    func prepareViews() {
        self.walletNameTextField.textPlaceHolder = "Wallet Name"
        self.newPasswordTextField.textPlaceHolder = "New Password"
        self.confirmPasswordTextField.textPlaceHolder = "Confirm Password"
        
    }
    
    @IBAction func createWalletButtonTapped(_ sender: Any) {
        self.createWalletViewModel?.createWalletRequestModel.Password = self.newPasswordTextField.textField.text
        self.createWalletViewModel?.createWalletRequestModel.WalletName = self.walletNameTextField.textField.text
        
        self.createWalletViewModel?.createWallet()
    }
    
}

extension CreateWalletViewController: CreateWalletViewModelDelegate {
    func createWalletSuccess() {
        print("to passcode")
        self.coordinator?.navigateTo(to: .toPassCodePage, with: nil)
    }
}
