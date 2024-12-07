//
//  Endpoint.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation

final class Endpoint: Requstable {
    var path: String
    
    var headerParameters: [String : String]?
    
    var queryParameters: [String : String]?
    
    var bodyParameters: [String : String]?
    
    init(
        path: String,
        headerParameters: [String : String]? = nil,
        queryParameters: [String : String]? = nil,
        bodyParameters: [String : String]? = nil
    ) {
        self.path = path
        self.headerParameters = headerParameters
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
    }
    
}
