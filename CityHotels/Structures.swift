//
//  Structures.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import Foundation

struct HotelItemData: Decodable {
    let id: Int
    let name: String
    let address: String
    let stars: Double
    let distance: Double
    let suites_availability: String
}
