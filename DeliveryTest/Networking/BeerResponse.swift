//
//  BeerResponse.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//

import Foundation

struct Beer: Decodable {
    var id: Int
    var name: String
    var description: String
    var imageUrl: String
    var abv: Double
    var section: BeerSection {
        if abv < 5 { return .less5 }
        else if abv < 7 { return .less7 }
        else if abv < 10 { return .less10 }
        else { return .more10 }
    }
}

struct BeerViewModel {
    struct Cell: MenuCellViewModel {
        var beerItem: Beer
    }
    let cells: [Cell]
}

enum BeerSection: String, CaseIterable {
    case less5 = "<5%"
    case less7 = "<7%"
    case less10 = "<10%"
    case more10 = ">10%"
}
