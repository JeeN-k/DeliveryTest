//
//  MenuModels.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Menu {
    
    enum FetchBeer {
        struct Request {
        }
        struct Response {
            var beer: [Beer]
        }
        struct ViewModel {
            var beer: [Beer]
            var beerViewModel: BeerViewModel
        }
    }
    
    enum ChangeSection {
        struct Request {
            var section: Int
        }
        struct Response {
            var section: Int
        }
        struct ViewModel {
            var section: Int
        }
    }
    
}
