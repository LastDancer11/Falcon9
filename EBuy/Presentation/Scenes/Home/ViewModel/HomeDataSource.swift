//
//  HomeDataSource.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

final class HomeDataSource: BaseDataSource {
    
    static private var viewModel: HomeViewModelProtocol!
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView?.delegate = self
        
        HomeDataSource.viewModel = viewModel
        
        multiSectionModels = []
    }
    
    init(with collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        singleCollectionSectionModels = []
    }
    
    
    override func refresh() {
        multiSectionModels = [[], [], [], [], [], [], [], []]
        
        HomeDataSource.viewModel.fetchOffers { fetchedOffers in
            let offers = fetchedOffers
            DispatchQueue.main.async {
                self.multiSectionModels[0].append(self.offerCell(data: offers[0]))
                self.multiSectionModels[3].append(self.offerCell(data: offers[1]))
                self.multiSectionModels[4].append(self.offerCell(data: offers[2]))
                self.tableView?.reloadData()
            }
        }
        
        multiSectionModels[1].append(categoryCell)
        
        multiSectionModels[2].append(recentlyViewedCell)
        
        multiSectionModels[5].append(savedItemsCell)
        
        multiSectionModels[6].append(brandsCell)
        
        multiSectionModels[7].append(habitsCell)
        
        tableView?.reloadData()
    }
    
    func setupCategoryItems() {
        
        HomeDataSource.viewModel.fetchCategories { fetchedCategories in
            let categories = fetchedCategories
            DispatchQueue.main.async {
                for category in categories {
                    self.singleCollectionSectionModels.append(self.categoryItemCell(data: category))
                }
                
                self.collectionView?.reloadData()
            }
            
        }
        
    }
    
    func setupRecentlyViewedItems() {
        
        HomeDataSource.viewModel.fetchRecentlyViewed { fetchedData in
            let recentlyViewed = fetchedData
            
            DispatchQueue.main.async {
                for recently in recentlyViewed {
                    self.singleCollectionSectionModels.append(self.recentlyViewedItemCell(data: recently))
                }
                
                self.collectionView?.reloadData()
            }
            
        }
        
    }
    
    func setupSavedItems() {
        
        HomeDataSource.viewModel.fetchSavedItems { savedItems in
            let items = savedItems
            DispatchQueue.main.async {
                for item in items {
                    self.singleCollectionSectionModels.append(self.savedItemCell(data: item))
                }
                
                self.collectionView?.reloadData()
            }
            
        }
        
    }
    
    func setupBrandsItems() {
        
        HomeDataSource.viewModel.fetchBrands { fetchedBrands in
            let brands = fetchedBrands
            DispatchQueue.main.async {
                for brand in brands {
                    self.singleCollectionSectionModels.append(self.brandsItemCell(data: brand))
                }
                
                self.collectionView?.reloadData()
            }
            
        }
        
    }
    
    func setupHabitItems() {
        
        HomeDataSource.viewModel.fetchHabits { fetchedHabits in
            let habits = fetchedHabits
            DispatchQueue.main.async {
                for habit in habits {
                    self.singleCollectionSectionModels.append(self.habitItemCell(data: habit))
                }
                
                self.collectionView?.reloadData()
            }
            
        }
        
    }
}

private extension HomeDataSource {
    
    private func offerCell(data: OfferModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: OfferCell.identifier,
                             userData: [.data: data])
    }
    
    private var categoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: CategoryCell.identifier)
    }
    
    private func categoryItemCell(data: CategoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: CategoryItemCell.identifier,
                             userData: [.data: data])
    }
    
    private var recentlyViewedCell: CellViewModel {
        return CellViewModel(cellIdentifier: RecentlyViewedCell.identifier)
    }
    
    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
                             userData: [.data: data])
    }
    
    private var savedItemsCell: CellViewModel {
        return CellViewModel(cellIdentifier: SavedItemsCell.identifier)
    }
    
    private func savedItemCell(data: SavedItemModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: SavedItemCell.identifier,
                             userData: [.data: data])
    }
    
    private var brandsCell: CellViewModel {
        return CellViewModel(cellIdentifier: BrandsCell.identifier)
    }
    
    private func brandsItemCell(data: BrandModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: BrandsItemCell.identifier,
                             userData: [.data: data])
    }
    
    private var habitsCell: CellViewModel {
        return CellViewModel(cellIdentifier: HabitsCell.identifier)
    }
    
    private func habitItemCell(data: HabitModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: HabitItemCell.identifier,
                             userData: [.data: data])
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
