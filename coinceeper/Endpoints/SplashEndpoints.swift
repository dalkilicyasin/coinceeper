//
//  SplashEndpoints.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation

struct SplashEndpoints {
    static func importWallet(body: ImportWalletRequestModel) -> Endpoint {
        let bodyParams: [String: String] = [
            "privateKey ":"\(body.privateKey ?? "")",
            "userName ":"\(body.userName ?? "")",
            "walletName ":"\(body.walletName ?? "")",
            "passwordHash ":"\(body.passwordHash ?? "")"
        ]
        
        return Endpoint(path: "import-wallet", bodyParameters: bodyParams) //TODO: will add path
    }
    
   static func createWallet(body: CreateWalletRequestModel) -> Endpoint {
       let headerParams: [String: String] = ["content-type": "application/json"]
       let bodyParams: [String: String] = [
            "Password":"\(body.Password ?? "")",
            "WalletName":"\(body.WalletName ?? "")"
        ]
        
       return Endpoint(path: "generate-wallet", headerParameters: headerParams, bodyParameters: bodyParams) //TODO: will add path
    }
}
