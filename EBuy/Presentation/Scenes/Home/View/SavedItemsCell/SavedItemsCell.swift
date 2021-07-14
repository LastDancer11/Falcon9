//
//  SavedItemsCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class SavedItemsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: SavedItemsCellDataSource!
    private var savedItemManager: SavedItemsManagerProtocol!
    private var viewModel: SavedItemsCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: SavedItemCell.self)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        configureDataSource()
    }
    
    private func configureDataSource() {
        savedItemManager = SavedItemsManager()
        viewModel = SavedItemsCellViewModel(with: savedItemManager)
        dataSource = SavedItemsCellDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
