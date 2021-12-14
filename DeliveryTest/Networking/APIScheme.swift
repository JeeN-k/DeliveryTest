//
//  APIScheme.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//

import Foundation

enum APIS{
    case beer
    
    func getAPI() -> APIScheme {
        switch self {
        case .beer:
            return APIScheme(scheme: "https", host: "api.punkapi.com", path: "/v2/beers")
        }
    }
}

struct APIScheme{
    var scheme: String
    var host: String
    var path: String

    init (scheme: String, host: String, path: String) {
        self.scheme = scheme
        self.host = host
        self.path = path
    }
}
