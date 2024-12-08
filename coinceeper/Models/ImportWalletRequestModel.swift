//
//  ImportWalletRequestModel.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation

struct ImportWalletRequestModel: Codable {
    var privateKey: String?
    var userName: String?
    var walletName: String?
    var passwordHash: String?
    
    init() {}
}
