//
//  HotelDetailsViewController.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class HotelDetailsViewController: UIViewController {
    
    var data: HotelItemData? {
        didSet {
            self.fetchData(id: data?.id)
        }
    }
    
    var details: HotelDetailsData?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray
        self.navigationItem.title = data?.name ?? ""
    }
    
    
    private func fetchData(id: Int?) {
        
        
        
        print("ID: \(id)")
    }

    
    
    
}
