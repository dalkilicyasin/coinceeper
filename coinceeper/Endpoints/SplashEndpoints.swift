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
        
        return Endpoint(path: "", bodyParameters: bodyParams) //TODO: will add path
    }
    
   static func createWallet(body: CreateWalletRequestModel) -> Endpoint {
        let bodyParams: [String: String] = [
            "userName ":"\(body.userName ?? "")",
            "password ":"\(body.password ?? "")",
            "walletName ":"\(body.walletName ?? "")",
            "ismultiSig ":"\(body.ismultiSig ?? false)",
            "requiredSignatures ":"\(body.requiredSignatures ?? "")",
            "referallCode ":"\(body.referallCode ?? "")"
        ]
        
        return Endpoint(path: "", bodyParameters: bodyParams) //TODO: will add path
    }
}
