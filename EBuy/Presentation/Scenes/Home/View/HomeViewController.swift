//
//  ViewController.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var homeDataSource: HomeDataSource!
    private var productsManager: ProductsManagerProtocol!
    private var offersManager: OffersManagerProtocol!
    private var viewModel: HomeViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        configureTableView()
                
        configureViewModel()
        
    }
    
    private func configureTableView() {
        tableView.registerNib(class: OfferCell.self)
        tableView.registerNib(class: CategoryCell.self)
        tableView.registerNib(class: RecentlyViewedCell.self)
        tableView.registerNib(class: SavedItemsCell.self)
        tableView.registerNib(class: BrandsCell.self)
        tableView.registerNib(class: HabitsCell.self)
    }
    
    private func configureViewModel() {
        productsManager = ProductsManager()
        offersManager = OffersManager()
        viewModel = HomeViewModel(with: productsManager, and: offersManager, coordinator: coordinator!)
        homeDataSource = HomeDataSource(with: tableView)
        
        homeDataSource.refresh()
    }


}

