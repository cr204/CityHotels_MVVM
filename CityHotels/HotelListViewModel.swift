//
//  HotelListViewModel.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class HotelListViewModel {
    
    func fetchHotelListData(limit: Int, completion: @escaping ([HotelItemData]?) -> Void) {
        
        NetworkService.getJSON(urlString: Links.hotelList) { (listData: [HotelItemData]?) in
            if let data = listData {
                completion(data)
            }
        }
        
    }
    
}

