//
//  OfferViewController.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class OfferCatalogViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: OfferCatalogDataSource!
    private var offerCatalogManager: OfferCatalogManagerProtocol!
    private var viewModel: OfferCatalogViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        collectionView.registerNib(class: CatalogCell.self)
        
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
    }
    
    private func configureDataSource() {
        offerCatalogManager = OfferCatalogManager()
        viewModel = OfferCatalogViewModel(with: offerCatalogManager)
        dataSource = OfferCatalogDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }

    @IBAction func sortTapped(_ sender: Any) {
        coordinator?.presentSortOptions()
    }
    
    
    @IBAction func filterTapped(_ sender: Any) {
        
    }
}
