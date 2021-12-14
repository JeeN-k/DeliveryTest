//
//  MenuWorker.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MenuWorkingLogic {
    func getBeer(completion: @escaping ([Beer]) -> ())
}

class MenuService: MenuWorkingLogic {
    var networking: Networking
    var fetcher: DataFetcher
    
    private var beerResponse: [Beer]?
    
    init() {
        self.networking = NetworkService()
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getBeer(completion: @escaping ([Beer]) -> ()) {
        fetcher.getBeer(response: { [weak self] beerResponse in
            self?.beerResponse = beerResponse
            guard let beerResponse = beerResponse else { return }
            completion(beerResponse)
        })
    }
}
