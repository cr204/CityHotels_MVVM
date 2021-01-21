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
    let image: String?
    let suites_availability: String
    let lat: Float64?
    let lon: Float64?
    
    var availabelRooms: Int {
        let count = suites_availability.split(separator: ":").count
        return count
    }
}
