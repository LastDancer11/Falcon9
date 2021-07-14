//
//  HomeDataSource.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class HomeDataSource: NSObject{
    
    private var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    private var offersList = [OfferModel]()
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchOffers { [weak self] offers in
            self?.offersList = offers
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension HomeDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.deque(OfferCell.self, for: indexPath)
            if !offersList.isEmpty {
                cell.configure(with: offersList[0])
            }
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.deque(CategoryCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.deque(OfferCell.self, for: indexPath)
            if !offersList.isEmpty {
                cell.configure(with: offersList[1])
            }
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.deque(OfferCell.self, for: indexPath)
            if !offersList.isEmpty {
                cell.configure(with: offersList[2])
            }
            return cell
        }
        if indexPath.row == 4 {
            let cell = tableView.deque(RecentlyViewedCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        if indexPath.row == 5 {
            let cell = tableView.deque(SavedItemsCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        if indexPath.row == 6 {
            let cell = tableView.deque(BrandsCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        if indexPath.row == 7 {
            let cell = tableView.deque(HabitsCell.self, for: indexPath)
            cell.configure()
            return cell
        }
        return .init()
    }
}

extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 0 {
            viewModel.coordinator.navigateToOfferCatalog(with: offersList[0].name ?? "")
        }
        
        if indexPath.row == 2 {
            viewModel.coordinator.navigateToOfferCatalog(with: offersList[1].name ?? "")
        }
        
        if indexPath.row == 3 {
            viewModel.coordinator.navigateToOfferCatalog(with: offersList[2].name ?? "")
        }
        
    }
}
