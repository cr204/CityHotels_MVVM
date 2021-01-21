//
//  HotelListViewModel.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class HotelListViewModel {
    
    var hotels: [HotelItemData] = []
    var sortByRoom = false
    
    func fetchHotelListData(completion: @escaping ([HotelItemData]?) -> Void) {
        
        NetworkService.getJSON(urlString: Links.hotelList) { (listData: [HotelItemData]?) in
            if let data = listData {
                self.hotels = data
                completion(data)
            }
        }
    }
    
    func sortList() {
        if sortByRoom {
            hotels.sort { $0.availabelRooms > $1.availabelRooms }
        } else {
            hotels.sort { $0.distance < $1.distance }
        }
        sortByRoom = !sortByRoom
    }
    
}

