//
//  BrandsCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class BrandsCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: BrandsCellDataSource!
    private var brandsManager: BrandsManagerProtocol!
    private var viewModel: BrandsCellViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: BrandsItemCell.self)
        
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
            }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        configureDataSource()
    }
    
    private func configureDataSource() {
        brandsManager = BrandsManager()
        viewModel = BrandsCellViewModel(with: brandsManager)
        dataSource = BrandsCellDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
