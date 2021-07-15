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
           layout.itemSize = CGSize(width: 160, height: 220)
           collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)
           layout.minimumLineSpacing = 20
           collectionView.collectionViewLayout = layout
           collectionView.isPagingEnabled = true
    }
    
    func configureDataSource() {
        homeDataSource = HomeDataSource(with: collectionView)
        
        homeDataSource.setupCategoryItems()
    }
    
}
