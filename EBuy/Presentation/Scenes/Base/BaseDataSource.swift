//
//  BaseDataSource.swift
//  EBuy
//
//  Created by Admin on 15.07.2021.
//

import UIKit

class BaseDataSource: NSObject {
    
    internal var singleSectionModels: [CellItem]!
    internal var multiSectionModels: [[CellItem]]!
    
    internal weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
        }
    }
    
    func refresh() {
        
    }
    
    func initCustomCell(for indexPath: IndexPath, with cellIdentifier: String) -> UITableViewCell? {
        return nil
    }
}

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
        return items(for: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = items(for: indexPath.section)[indexPath.row]
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
            if let _cell = initCustomCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? CellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    func items(for section: Int) -> [CellItem] {
        if singleSectionModels != nil {
            return singleSectionModels
        } else if multiSectionModels != nil {
            return multiSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}

protocol CellConfigurable: UITableViewCell {
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

