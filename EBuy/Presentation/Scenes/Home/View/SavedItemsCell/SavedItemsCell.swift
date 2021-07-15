//
//  SavedItemsCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class SavedItemsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var homeDataSource: HomeDataSource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: SavedItemCell.self)
        
        setupCollectionViewFlowLayout()
        
        configureDataSource()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCollectionViewFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 335, height: 120)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    func configureDataSource() {
        homeDataSource = HomeDataSource(with: collectionView)
        
        homeDataSource.setupSavedItems()
    }
    
}
