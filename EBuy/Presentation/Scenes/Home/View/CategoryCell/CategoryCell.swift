//
//  CategoryCell.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: CategoriesCellDataSource!
    private var categoryManager: CategoriesManagerProtocol!
    private var viewModel: CategoriesCellViewModelProtocol!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: CategoryItemCell.self)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        configureDataSource()
    }
        
        
    private func configureDataSource() {
        categoryManager = CategoriesManager()
        viewModel = CategoriesCellViewModel(with: categoryManager)
        dataSource = CategoriesCellDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
}
