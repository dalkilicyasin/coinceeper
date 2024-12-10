//
//  NetworkProtocols.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation
import Alamofire

public protocol NetworkConfigurable {
    var baseURL: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
    var bodyParameters: [String: String] { get }
}


public protocol Requstable {
    var path: String { get }
    var headerParameters: [String: String]? { get }
    var queryParameters: [String: String]?{ get }
    var bodyParameters: [String: String]? { get }
}


private extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonData = try JSONSerialization.jsonObject(with: data)
        return jsonData as? [String: Any]
    }
}


protocol NetworkService {
    func request<T: Codable>(_ endpoint: Endpoint, type: T.Type, method: HTTPMethod, completion: @escaping (Result<T, NetworkError>) -> Void)
}
