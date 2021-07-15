//
//  BaseDataSource.swift
//  EBuy
//
//  Created by Admin on 15.07.2021.
//

import UIKit

class BaseDataSource: NSObject {
    
    // MARK: - Variables
    var singleSectionModels: [CellItem]!
    var multiSectionModels: [[CellItem]]!
    
    var singleCollectionSectionModels: [CellItem]!
    var multiCollectionSectionModels: [[CellItem]]!
    
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
        }
    }
    
    weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.dataSource = self
        }
    }
    
    func refresh() {
        
    }
    
    func initCustomTableViewCell(for indexPath: IndexPath, with cellIdentifier: String) -> UITableViewCell? {
        return nil
    }
    
    func initCustomCollectionViewCell(for indexPath: IndexPath, with cellIdentifier: String) -> UICollectionViewCell? {
        return nil
    }
}

// MARK: UITable View Data Source
extension BaseDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if singleSectionModels != nil {
            return 1
        } else if multiSectionModels != nil {
            return multiSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsForTableView(for: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = itemsForTableView(for: indexPath.section)[indexPath.row]
        let cell: UITableViewCell
        
        
        switch cellViewModel.cellIdentifier {
        case OfferCell.identifier:
            cell = tableView.deque(OfferCell.self, for: indexPath)
        case CategoryCell.identifier:
            cell = tableView.deque(CategoryCell.self, for: indexPath)
        case RecentlyViewedCell.identifier:
            cell = tableView.deque(RecentlyViewedCell.self, for: indexPath)
        case SavedItemsCell.identifier:
            cell = tableView.deque(SavedItemsCell.self, for: indexPath)
        case BrandsCell.identifier:
            cell = tableView.deque(BrandsCell.self, for: indexPath)
        case HabitsCell.identifier:
            cell = tableView.deque(HabitsCell.self, for: indexPath)
        default:
            if let _cell = initCustomTableViewCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? TableCellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    func itemsForTableView(for section: Int) -> [CellItem] {
        if singleSectionModels != nil {
            return singleSectionModels
        } else if multiSectionModels != nil {
            return multiSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}

// MARK: UICollectionView Data Source

extension BaseDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if singleCollectionSectionModels != nil {
            return 1
        } else if multiCollectionSectionModels != nil {
            return multiCollectionSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsForCollection(for: section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = itemsForCollection(for: indexPath.section)[indexPath.row]
        let cell: UICollectionViewCell
        
        switch cellViewModel.cellIdentifier {
        case CategoryItemCell.identifier:
            cell = collectionView.deque(CategoryItemCell.self, for: indexPath)
        case RecentlyViewedItemCell.identifier:
            cell = collectionView.deque(RecentlyViewedItemCell.self, for: indexPath)
        case SavedItemCell.identifier:
            cell = collectionView.deque(SavedItemCell.self, for: indexPath)
        case BrandsItemCell.identifier:
            cell = collectionView.deque(BrandsItemCell.self, for: indexPath)
        case HabitItemCell.identifier:
            cell = collectionView.deque(HabitItemCell.self, for: indexPath)
        default:
            if let _cell = initCustomCollectionViewCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? CollectionCellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    func itemsForCollection(for section: Int) -> [CellItem] {
        if singleCollectionSectionModels != nil {
            return singleCollectionSectionModels
        } else if multiCollectionSectionModels != nil {
            return multiCollectionSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}

// MARK: Setupers
protocol TableCellConfigurable: UITableViewCell {
    func configure(with item: CellItem)
}

protocol CollectionCellConfigurable: UICollectionViewCell {
    func configure(with item: CellItem)
}

protocol CellItem {
    var cellIdentifier: String { get }
}

struct CellViewModel: CellItem {
    
    private(set) var cellIdentifier: String
    
    let userData: [CellViewModelUserDataKey: Any]
    
    init(cellIdentifier: String,
         userData: [CellViewModelUserDataKey: Any]? = nil) {
        self.cellIdentifier = cellIdentifier
        self.userData = userData ?? [:]
    }
}

enum CellViewModelUserDataKey {
    case data
}
