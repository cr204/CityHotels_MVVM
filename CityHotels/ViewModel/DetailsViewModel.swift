//
//  DetailsViewModel.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class DetailViewModel {
    
    var details: HotelItemData?
    
    func fetchHotelDetailsData(id: Int, completion: @escaping (HotelItemData?) -> Void) {
        
        let link = Links.hotelDetails + "\(id)" + ".json"
        NetworkService.getJSON(urlString: link) { (details: HotelItemData?) in
            if let data = details {
                completion(data)
            }
        }
    }
}
