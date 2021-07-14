//
//  BrandsCellDataSource.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class BrandsCellDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var brands = [BrandModel]()
    private var viewModel: BrandsCellViewModelProtocol!
    
    // MARK: - Init
    init(with collectionView: UICollectionView, viewModel: BrandsCellViewModelProtocol) {
        super.init()
                
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchBrands { [weak self] brands in
            self?.brands = brands
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
}

// MARK: - UICollectionView Data Source
extension BrandsCellDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(BrandsItemCell.self, for: indexPath)
        cell.configure(with: brands[indexPath.row])
        return cell
    }
}

extension BrandsCellDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
