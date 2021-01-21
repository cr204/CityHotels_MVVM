//
//  HotelListViewController.swift
//  CityHotels
//
//  Created by Jasur Rajabov on 1/21/21.
//

import UIKit

class HotelListViewController: UIViewController {
    
    private let viewModel = HotelListViewModel()
   private var topSafeArea: CGFloat = 0

    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.bounces = true
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor.clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if #available(iOS 11.0, *) {
            topSafeArea = view.safeAreaInsets.top
        } else {
            topSafeArea = topLayoutGuide.length
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let btnSort = UIBarButtonItem(title: "sort", style: .plain, target: self, action: #selector(sortTapped))
        
        self.view.backgroundColor = UIColor.lightGray
        self.navigationItem.title = "City Hotels"
        self.navigationItem.rightBarButtonItem = btnSort
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListViewCell.self, forCellReuseIdentifier: "HotelListCell")
        
        viewModel.fetchHotelListData() { _ in
            DispatchQueue.main.async {
                self.setupViews()
            }
        }
    }
    

    private func setupViews() {
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: tableView)
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    @objc private func sortTapped() {
        viewModel.sortList()
        self.navigationItem.rightBarButtonItem?.title = viewModel.sortByRoom ? "By rooms" : "By distance"
        DispatchQueue.main.async {
            self.tableView.reloadSections([0], with: .fade)
        }
        
    }

}

extension HotelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelListCell", for: indexPath) as! ListViewCell
        DispatchQueue.main.async {
            cell.hotelDetails = self.viewModel.hotels[indexPath.row]
        }
        return cell
    }

}

extension HotelListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = HotelDetailsViewController()
        details.data = viewModel.hotels[indexPath.row]
        self.navigationController?.pushViewController(details, animated: true)
    }

}
