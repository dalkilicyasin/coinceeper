//
//  CreateWalletViewModel.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 10.12.2024.
//

import Foundation

protocol CreateWalletViewModelDelegate: AnyObject {
    func createWalletSuccess()
}

class CreateWalletViewModel {
    
    private let splashRepository: SplashRepository
    
    var createWalletRequestModel: CreateWalletRequestModel = CreateWalletRequestModel()
    weak var delegate: CreateWalletViewModelDelegate?
    
    init(splashRepository: SplashRepository) {
        self.splashRepository = splashRepository
    }
    
    func createWallet() {
        self.splashRepository.createWallet(request: self.createWalletRequestModel) { result in
            switch result {
            case .success(let response):
                print("\(response)")
                self.delegate?.createWalletSuccess()
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
