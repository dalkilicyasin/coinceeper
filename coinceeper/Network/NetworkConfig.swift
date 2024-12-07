//
//  NetworkConfig.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation

public struct NetworkConfig: NetworkConfigurable {
    public var baseURL: URL
    public var headers: [String : String]
    public var queryParameters: [String : String]
    public var bodyParameters: [String : String]
    
    public init(
        baseURL: URL,
        headers: [String : String] = [:],
        queryParameters: [String : String] = [:],
        bodyParameters: [String : String] = [:]
    ) {
        self.baseURL = baseURL
        self.headers = headers
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
    }
}
