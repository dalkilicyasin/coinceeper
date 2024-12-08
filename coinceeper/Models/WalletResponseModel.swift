//
//  WalletResponse.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 8.12.2024.
//

import Foundation

struct WalletResponseModel: Codable {
    var success: Bool
    var userID: String?
    var username: String?
    var walletID: String?
    var walletName: String?
    var walletAddress: String?
    var isMultiSig: Bool?
    var requiredSignatures: String?
    var blockchainID: Int?
    var publicAddress: String?
    var privateKey: String?
    var message: String?
}
