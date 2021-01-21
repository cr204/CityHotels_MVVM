//
//  HotelListViewModel.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class HotelListViewModel {
    
    var hotels: [HotelItemData] = []
    
    func fetchHotelListData(limit: Int, completion: @escaping ([HotelItemData]?) -> Void) {
        
        NetworkService.getJSON(urlString: Links.hotelList) { (listData: [HotelItemData]?) in
            if let data = listData {
                self.hotels = data
                completion(data)
            }
        }
    }
    
}

