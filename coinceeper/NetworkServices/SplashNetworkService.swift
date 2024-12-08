//
//  SplashNetworkService.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation
import Alamofire

final class SplashNetworkService {
    
    private let networkManager: NetworkManager?
    
    init(networkManager: NetworkManager? = nil) {
        self.networkManager = networkManager
    }
}

extension SplashNetworkService: SplashRepository {
    
    func importWallet(request: ImportWalletRequestModel, completion: @escaping (Result<AnyCodable, NetworkError>) -> Void) {
        let endpoint = SplashEndpoints.importWallet(body: request)
        self.networkManager?.request(endpoint, type: AnyCodable.self, method: .post) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                print("\(error)")
                completion(.failure(.decodeFault))
            }
        }
    }
    
    func createWallet(request: CreateWalletRequestModel, completion: @escaping (Result<AnyCodable, NetworkError>) -> Void) {
        let endpont = SplashEndpoints.createWallet(body: request)
        
        self.networkManager?.request(endpont, type: AnyCodable.self, method: .post) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                print("\(error)")
                completion(.failure(.decodeFault))
            }
        }
    }
}


