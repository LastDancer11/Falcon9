//
//  HomeDataSource.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

final class HomeDataSource: BaseDataSource {
    
    
    private var savedItems = ["saved item1", "item2", "Saved item3"]
    
    init(with tableView: UITableView) {
        super.init()
        
        self.tableView = tableView
        self.tableView?.delegate = self
        
        multiSectionModels = []
    }
    
    
    override func refresh() {
        multiSectionModels = [[], [], [], [], [], [], [], []]
       
        multiSectionModels[0].append(offerCell)
        
        multiSectionModels[1].append(categoryCell)
        
        multiSectionModels[2].append(recentlyViewedCell)
        
        multiSectionModels[3].append(offerCell)
        
        multiSectionModels[4].append(offerCell)
        
        multiSectionModels[5].append(savedItemsCell)
        
        multiSectionModels[6].append(brandsCell)
        
        multiSectionModels[7].append(habitsCell)
        
        tableView?.reloadData()
    }
}

private extension HomeDataSource {
    
    private var offerCell: CellViewModel {
        return CellViewModel(cellIdentifier: OfferCell.identifier)
    }
    
    private var categoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: CategoryCell.identifier)
    }
    
    private var recentlyViewedCell: CellViewModel {
        return CellViewModel(cellIdentifier: RecentlyViewedCell.identifier)
    }
    
    private var savedItemsCell: CellViewModel {
        return CellViewModel(cellIdentifier: SavedItemsCell.identifier)
    }
    
    private var brandsCell: CellViewModel {
        return CellViewModel(cellIdentifier: BrandsCell.identifier)
    }
    
    private var habitsCell: CellViewModel {
        return CellViewModel(cellIdentifier: HabitsCell.identifier)
    }
}

extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 0 {
          //  viewModel.coordinator.navigateToOfferCatalog(with: offersList[0].name ?? "")
            print("tapped")
        }
        
        if indexPath.row == 2 {
         //   viewModel.coordinator.navigateToOfferCatalog(with: offersList[1].name ?? "")
        }
        
        if indexPath.row == 3 {
         //   viewModel.coordinator.navigateToOfferCatalog(with: offersList[2].name ?? "")
        }
        
    }
}
