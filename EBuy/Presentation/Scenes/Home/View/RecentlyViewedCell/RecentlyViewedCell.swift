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
    
    private var dataSource: RecentlyViewedCellDataSource!
    private var categoryManager: RecentlyViewedManagerProtocol!
    private var viewModel: RecentlyViewedCellViewModelProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        redDotView.layer.cornerRadius = 10
        
        collectionView.registerNib(class: RecentlyViewedItemCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        configureDataSource()
    }
        
        
    private func configureDataSource() {
        categoryManager = RecentlyManager()
        viewModel = RecentlyViewedCellViewModel(with: categoryManager)
        dataSource = RecentlyViewedCellDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
