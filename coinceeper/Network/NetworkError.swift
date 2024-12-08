//
//  NetworkError.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 8.12.2024.
//

import Foundation

enum NetworkError: Error {
    case noContentReturned
    case decodeFault
    case httpError(statusCode: Int)
    case nonFatal(error: Error)
    case missingURL

    var message: String {
        switch self {
        case .noContentReturned, .nonFatal:
            return "An unknown error occured"
        case .httpError(let statusCode):
            return "\(statusCode) Error occured"
        case .decodeFault:
            return "Decode Fault"
        case .missingURL:
            return "URL is not found"
        }
    }
}
