//
//  HotelDetailsViewController.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit
import MapKit


class HotelDetailsViewController: UIViewController {
    
    let viewModel = DetailViewModel()
    let locationManager = CLLocationManager()
    let regionInMeters = 500.0

    var data: HotelItemData? {
        didSet {
            self.fetchData(id: data?.id)
        }
    }

//    let activityIndicator: UIActivityIndicatorView = {
//        let view = UIActivityIndicatorView()
//        view.style = .whiteLarge
//        view.hidesWhenStopped = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    let hotelImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .center
        imgView.backgroundColor = .lightGray
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let labelHotelName: UILabel = {
        let label = UILabel()
        label.text = "    Hotel name"
        label.textColor = Colors.textDarkBlue
        label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let container: ContainerView = {
        let view = ContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let icon: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "icon_loc")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let labelAddress: UILabel = {
        let label = UILabel()
        label.textColor = Colors.textDarkBlue
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgStar: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon_star")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let labelStars: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = Colors.textRed
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let mapView: MKMapView = {
        let view = MKMapView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor  //Colors.textDarkBlue.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelDistance: UILabel = {
        let label = UILabel()
        label.textColor = Colors.textDarkBlue
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgBed: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon_bed")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let labelRoom: UILabel = {
        let label = UILabel()
        label.text = "Available Rooms"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelAvail: UILabel = {
        let label = UILabel()
        label.text = "1:22:34:56"
        label.textColor = Colors.textDarkBlue
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.bgLight
        self.navigationItem.title = data?.name ?? ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
//        activityIndicator.startAnimating()
//        view.addSubview(activityIndicator)
//        NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: activityIndicator, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true

    }
    
    
    private func fetchData(id: Int?) {
        guard let hotelId = id else {
            print("Error! Hotel id is not given")
            return
        }
        
        viewModel.fetchHotelDetailsData(id: hotelId) { _ in
            DispatchQueue.main.sync {
                self.setupViews()
            }
        }
    }
    
    private func setupViews() {
        
        guard let details = viewModel.details else {
            return
        }
        
        if let link = details.image {
            print(Links.hotelDetails + link)
            hotelImageView.downloaded(from: Links.hotelDetails + link)
        }
        
        view.addSubview(hotelImageView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: hotelImageView)
        hotelImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        NSLayoutConstraint(item: hotelImageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        
        view.addSubview(labelHotelName)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: labelHotelName)
        labelHotelName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        NSLayoutConstraint(item: labelHotelName, attribute: .bottom, relatedBy: .equal, toItem: hotelImageView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        labelHotelName.text = "   \(details.name)"
        
        view.addSubview(container)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: container)
        NSLayoutConstraint(item: container, attribute: .top, relatedBy: .equal, toItem: labelHotelName, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: container, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -30).isActive = true
        
        container.addSubview(icon)
        icon.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 15.0).isActive = true
        NSLayoutConstraint(item: icon, attribute: .left, relatedBy: .equal, toItem: container, attribute: .left, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: icon, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1, constant: 17).isActive = true
        
        container.addSubview(labelAddress)
        container.addConstraintsWithFormat(format: "H:|-40-[v0]-45-|", views: labelAddress)
        NSLayoutConstraint(item: labelAddress, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1, constant: 17).isActive = true
        labelAddress.text = details.address
        
        container.addSubview(imgStar)
        NSLayoutConstraint(item: imgStar, attribute: .centerY, relatedBy: .equal, toItem: icon, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imgStar, attribute: .right, relatedBy: .equal, toItem: container, attribute: .right, multiplier: 1, constant: -35).isActive = true
        
        container.addSubview(labelStars)
        NSLayoutConstraint(item: labelStars, attribute: .centerY, relatedBy: .equal, toItem: icon, attribute: .centerY, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: labelStars, attribute: .right, relatedBy: .equal, toItem: container, attribute: .right, multiplier: 1, constant: -12).isActive = true
        labelStars.text = "\(details.stars)"
        
        
        container.addSubview(mapView)
        mapView.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        container.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: mapView)
        NSLayoutConstraint(item: mapView, attribute: .centerX, relatedBy: .equal, toItem: container, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1, constant: 60).isActive = true
        self.centerViewOnLocation()
        
        container.addSubview(labelDistance)
        NSLayoutConstraint(item: labelDistance, attribute: .top, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: labelDistance, attribute: .left, relatedBy: .equal, toItem: mapView, attribute: .left, multiplier: 1, constant: 0).isActive = true
        labelDistance.text = "\(details.distance) km away from current location!"
        
        container.addSubview(imgBed)
        imgBed.heightAnchor.constraint(equalToConstant: 15).isActive = true
        NSLayoutConstraint(item: imgBed, attribute: .top, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: imgBed, attribute: .left, relatedBy: .equal, toItem: container, attribute: .left, multiplier: 1, constant: 20).isActive = true
        
        container.addSubview(labelRoom)
        NSLayoutConstraint(item: labelRoom, attribute: .centerY, relatedBy: .equal, toItem: imgBed, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: labelRoom, attribute: .left, relatedBy: .equal, toItem: imgBed, attribute: .right, multiplier: 1, constant: 10).isActive = true
        
        container.addSubview(labelAvail)
        NSLayoutConstraint(item: labelAvail, attribute: .top, relatedBy: .equal, toItem: imgBed, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: labelAvail, attribute: .left, relatedBy: .equal, toItem: container, attribute: .left, multiplier: 1, constant: 20).isActive = true
        
    }
    
    @objc private func onRotated() {
        if(UIDevice.current.orientation.isLandscape) {
            print("landscape")
            self.hideViews(true)
        }

        if(UIDevice.current.orientation.isPortrait) {
            print("Portrait")
            self.hideViews(false)
        }
    }

    
    override func viewDidLayoutSubviews() {
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        maskView.backgroundColor = .blue
        maskView.layer.cornerRadius = 0
        hotelImageView.mask = maskView
    }
    
    func centerViewOnLocation() {
        guard let lat = viewModel.details?.lat, let lon = viewModel.details?.lon else { return }
        let center = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
        
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lon)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = "hotel"
        self.mapView.addAnnotation(objectAnnotation)
        
    }
    
    func hideViews(_ bool: Bool) {
        mapView.isHidden = bool
        labelDistance.isHidden = bool
        imgBed.isHidden = bool
        labelRoom.isHidden = bool
        labelAvail.isHidden = bool
    }
    
}
