//
//  RecentlyViewedCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class RecentlyViewedCell: UITableViewCell {

    @IBOutlet weak var redDotView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var homeDataSource: HomeDataSource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        redDotView.layer.cornerRadius = 10
        
        collectionView.registerNib(class: RecentlyViewedItemCell.self)
        
        setupCollectionViewFlowLayout()
        
        configureDataSource()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCollectionViewFlowLayout() {
        let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           layout.itemSize = CGSize(width: 160, height: 240)
           collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)

           collectionView.collectionViewLayout = layout
           collectionView.isPagingEnabled = true
    }
    
    func configureDataSource() {
        homeDataSource = HomeDataSource(with: collectionView)
        
        homeDataSource.setupRecentlyViewedItems()
    }
    
}
