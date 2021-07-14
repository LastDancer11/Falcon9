//
//  RecentlyViewedCellDataSource.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class RecentlyViewedCellDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var recentlyViewed = [RecentlyViewedModel]()
    private var viewModel: RecentlyViewedCellViewModelProtocol!
    
    // MARK: - Init
    init(with collectionView: UICollectionView, viewModel: RecentlyViewedCellViewModelProtocol) {
        super.init()
                
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchRecentlyViewed { [weak self] recentlyViewed in
            self?.recentlyViewed = recentlyViewed
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
}

// MARK: - UICollectionView Data Source
extension RecentlyViewedCellDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentlyViewed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(RecentlyViewedItemCell.self, for: indexPath)
        cell.configure(with: recentlyViewed[indexPath.row])
        return cell
    }
}

extension RecentlyViewedCellDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

