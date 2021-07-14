//
//  OfferDataSource.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class OfferCatalogDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var offerCatalogList = [OfferCatalogModel]()
    private var viewModel: OfferCatalogViewModelProtocol!
    
    // MARK: - Init
    init(with collectionView: UICollectionView, viewModel: OfferCatalogViewModelProtocol) {
        super.init()
                
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchOfferCatalog { [weak self] offerCatalog in
            self?.offerCatalogList = offerCatalog
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
}

// MARK: - UICollectionView Data Source
extension OfferCatalogDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offerCatalogList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(CatalogCell.self, for: indexPath)
        cell.configure(with: offerCatalogList[indexPath.row])
        return cell
    }
}

extension OfferCatalogDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}


