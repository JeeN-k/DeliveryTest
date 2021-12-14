//
//  MenuPresenter.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MenuPresentationLogic {
    func presentData(response: Menu.FetchBeer.Response)
    func presentSection(response: Menu.ChangeSection.Response)
}

class MenuPresenter: MenuPresentationLogic {
    weak var viewController: MenuDisplayLogic?
    
    func presentData(response: Menu.FetchBeer.Response) {
        let beer = response.beer
        let cells = beer.map { beerItem in
            cellViewModel(from: beerItem)
        }
        let beerViewModel = BeerViewModel.init(cells: cells)
        let viewModel = Menu.FetchBeer.ViewModel(beer: beer, beerViewModel: beerViewModel)
        viewController?.displayMenu(viewModel: viewModel)
    }
    
    func presentSection(response: Menu.ChangeSection.Response) {
        let viewModel = Menu.ChangeSection.ViewModel(section: response.section)
        viewController?.changeSection(viewModel: viewModel)
    }
    
    private func cellViewModel(from beerItem: Beer) -> BeerViewModel.Cell {
        return BeerViewModel.Cell.init(beerItem: beerItem)
    }
    
}
