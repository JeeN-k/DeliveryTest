//
//  NetworkDataFetcher.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//

import Foundation

protocol DataFetcher {
    func getBeer(response: @escaping([Beer]?) -> ())
}

class NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getBeer(response: @escaping ([Beer]?) -> ()) {
        let api = APIS.beer.getAPI()
        networking.getRequest(apiScheme: api, parameters: nil) { data, error in
            if let error = error {
                print("Error data recieved \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: [Beer].self, from: data)
            response(decoded)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
