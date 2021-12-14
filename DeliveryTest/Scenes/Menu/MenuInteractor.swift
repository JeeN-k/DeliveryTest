//
//  MenuInteractor.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MenuBusinessLogic {
    func makeRequest(request: Menu.FetchBeer.Request)
    func goToSection(request: Menu.ChangeSection.Request)
}

protocol MenuDataStore {
    var beer: [Beer] { get set }
}

class MenuInteractor: MenuBusinessLogic, MenuDataStore {
    
    var beer: [Beer] = []
    var presenter: MenuPresentationLogic?
    lazy var service: MenuWorkingLogic = MenuService()
    
    func makeRequest(request: Menu.FetchBeer.Request) {
        service.getBeer(completion: { beerResponse in
            self.beer = beerResponse
            let response = Menu.FetchBeer.Response(beer: beerResponse)
            self.presenter?.presentData(response: response)
        })
    }
    
    func goToSection(request: Menu.ChangeSection.Request) {
        let response = Menu.ChangeSection.Response(section: request.section)
        self.presenter?.presentSection(response: response)
    }
    
}
