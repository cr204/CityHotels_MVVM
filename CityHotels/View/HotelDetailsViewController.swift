//
//  HotelDetailsViewController.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class HotelDetailsViewController: UIViewController {
    
    let viewModel = DetailViewModel()
    
    var data: HotelItemData? {
        didSet {
            self.fetchData(id: data?.id)
        }
    }
    
    var details: HotelItemData?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray
        self.navigationItem.title = data?.name ?? ""
        
    }
    
    
    private func fetchData(id: Int?) {
        
        guard let hotelId = id else {
            print("Error! Hotel id is not given")
            return
        }
        
        viewModel.fetchHotelDetailsData(id: hotelId) { _ in
            DispatchQueue.main.async {
                self.setupViews()
            }
        }
    }
    
    private func setupViews() {
        
    }

    
    
    
}
