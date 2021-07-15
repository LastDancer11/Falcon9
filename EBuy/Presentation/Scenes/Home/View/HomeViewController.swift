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
    private var viewModel: HomeViewModelProtocol!
    
    private var productsManager: ProductsManagerProtocol!
    private var offersManager: OffersManagerProtocol!
    private var categoriesManager: CategoriesManagerProtocol!
    private var recentlyViewedManager: RecentlyViewedManagerProtocol!
    private var savedItemsManager: SavedItemsManagerProtocol!
    private var brandsManager: BrandsManagerProtocol!
    private var habitsManager: HabitsManagerProtocol!
    
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
        categoriesManager = CategoriesManager()
        recentlyViewedManager = RecentlyViewedManager()
        savedItemsManager = SavedItemsManager()
        brandsManager = BrandsManager()
        habitsManager = HabitsManager()
        
        viewModel = HomeViewModel(productsManager: productsManager,
                                  offersManager: offersManager,
                                  categoriesManager: categoriesManager,
                                  recentlyViewedManager: recentlyViewedManager,
                                  savedItemsManager: savedItemsManager,
                                  brandsManager: brandsManager,
                                  habitsManager: habitsManager,
                                  coordinator: coordinator!)
        
        homeDataSource = HomeDataSource(with: tableView, viewModel: viewModel)
        
        homeDataSource.refresh()
    }


}

