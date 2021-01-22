//
//  ListViewCell.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    var hotelDetails: HotelItemData? {
        didSet {
            self.labelName.text = self.hotelDetails?.name ?? ""
            self.labelAddress.text = self.hotelDetails?.address ?? "adres not shown"
            self.labelDistance.text = String(self.hotelDetails?.distance ?? 0) + " km away"
            self.labelAvailable.text = " - \(String(self.hotelDetails?.availabelRooms ?? 0)) rooms"
            self.stars.setValue(n: Int(self.hotelDetails?.stars ?? 0.0))
            self.initViews()
        }
    }
    
    let labelName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelAddress: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let icon: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "icon_loc")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let labelDistance: UILabel = {
        let label = UILabel()
        label.textColor = Colors.textDarkBlue
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelAvailable: UILabel = {
        let label = UILabel()
        label.textColor = Colors.textGray
        label.font = UIFont.italicSystemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stars: StarsView = {
        let view = StarsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    
    func initViews() {
        self.backgroundColor = .clear
        
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = 10
        
        self.contentView.addSubview(labelName)
        NSLayoutConstraint(item: labelName, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 17).isActive = true
        NSLayoutConstraint(item: labelName, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: labelName, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 12).isActive = true
        
        self.contentView.addSubview(labelAddress)
        NSLayoutConstraint(item: labelAddress, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: labelAddress, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: labelAddress, attribute: .top, relatedBy: .equal, toItem: labelName, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        self.contentView.addSubview(icon)
        icon.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 15.0).isActive = true
        NSLayoutConstraint(item: icon, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: icon, attribute: .top, relatedBy: .equal, toItem: labelAddress, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        
        self.contentView.addSubview(labelDistance)
        NSLayoutConstraint(item: labelDistance, attribute: .left, relatedBy: .equal, toItem: icon, attribute: .right, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: labelDistance, attribute: .centerY, relatedBy: .equal, toItem: icon, attribute: .centerY, multiplier: 1, constant: 2).isActive = true
        
        self.contentView.addSubview(labelAvailable)
        NSLayoutConstraint(item: labelAvailable, attribute: .left, relatedBy: .equal, toItem: labelDistance, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: labelAvailable, attribute: .centerY, relatedBy: .equal, toItem: icon, attribute: .centerY, multiplier: 1, constant: 2).isActive = true
        
        self.contentView.addSubview(stars)
        NSLayoutConstraint(item: stars, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -120).isActive = true
        NSLayoutConstraint(item: stars, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: -37).isActive = true
        
    }
    


}
