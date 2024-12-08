//
//  SplashRepositories.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation

protocol SplashRepository {
    func importWallet(request: ImportWalletRequestModel, completion: @escaping(Result<AnyCodable, NetworkError>) -> Void)
    func createWallet(request: CreateWalletRequestModel, completion: @escaping(Result<AnyCodable, NetworkError>) -> Void)
}
