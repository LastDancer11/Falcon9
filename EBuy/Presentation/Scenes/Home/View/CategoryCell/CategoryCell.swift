//
//  CategoryCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var homeDataSource: HomeDataSource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: CategoryItemCell.self)
        collectionView.delegate = self
        
        configureDataSource()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureDataSource() {
        homeDataSource = HomeDataSource(with: collectionView)
        
        homeDataSource.setupRecentlyViewedItems()
    }
    
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    
}
