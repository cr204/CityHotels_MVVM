//
//  StartsView.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class StarsView: UIView {

    var star1 = UIImageView(image: UIImage(named: "icon_star"))
    let star2 = UIImageView(image: UIImage(named: "icon_star"))
    let star3 = UIImageView(image: UIImage(named: "icon_star"))
    let star4 = UIImageView(image: UIImage(named: "icon_star"))
    let star5 = UIImageView(image: UIImage(named: "icon_star"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        
        self.addSubview(star1)
        
        star2.frame.origin.x = 20
        self.addSubview(star2)
        
        star3.frame.origin.x = 40
        self.addSubview(star3)
        
        star4.frame.origin.x = 60
        self.addSubview(star4)
        
        star5.frame.origin.x = 80
        self.addSubview(star5)
    }
    
    func reset() {
        star1.alpha = 0.2
        star2.alpha = 0.2
        star3.alpha = 0.2
        star4.alpha = 0.2
        star5.alpha = 0.2
    }
    
    func setValue(n: Int) {
        self.reset()
        if n > 0 { star1.alpha = 1.0 }
        if n > 1 { star2.alpha = 1.0 }
        if n > 2 { star3.alpha = 1.0 }
        if n > 3 { star4.alpha = 1.0 }
        if n > 4 { star5.alpha = 1.0 }
    }
    

    
    
}
