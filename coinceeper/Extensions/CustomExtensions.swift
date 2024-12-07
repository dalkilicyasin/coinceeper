//
//  CustomExtensions.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation


extension URLComponents {
    mutating func setQueryItems(with  parameters: [String: String]) {
        self.queryItems = parameters.map{ URLQueryItem(name: $0.key, value: $0.value)}
    }
}
