//
//  CreateWalletRequest.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation

struct CreateWalletRequestModel {
    var userName: String?
    var password: String?
    var walletName: String?
    var ismultiSig: Bool?
    var requiredSignatures: String?
    var referallCode: String?
    
    init () {}
}
