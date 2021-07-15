//
//  HomeViewModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol HomeViewModelProtocol {
    
    func fetchProducts(completion: @escaping ([ProductModel]) -> Void)
    func fetchOffers(completion: @escaping ([OfferModel]) -> Void)
    func fetchCategories(completion: @escaping ([CategoryModel]) -> Void)
    func fetchRecentlyViewed(completion: @escaping ([RecentlyViewedModel]) -> Void)
    func fetchSavedItems(completion: @escaping ([SavedItemModel]) -> Void)
    func fetchBrands(completion: @escaping ([BrandModel]) -> Void)
    func fetchHabits(completion: @escaping ([HabitModel]) -> Void)
    
    var coordinator: CoordinatorProtocol { get }
    
    init(productsManager: ProductsManagerProtocol,
         offersManager: OffersManagerProtocol,
         categoriesManager: CategoriesManagerProtocol,
         recentlyViewedManager: RecentlyViewedManagerProtocol,
         savedItemsManager: SavedItemsManagerProtocol,
         brandsManager: BrandsManagerProtocol,
         habitsManager: HabitsManagerProtocol,
         coordinator: CoordinatorProtocol)
}

final class HomeViewModel: HomeViewModelProtocol {
   
    private let productsManager: ProductsManagerProtocol
    private let offersManager: OffersManagerProtocol
    private let categoriesManager: CategoriesManagerProtocol
    private let recentlyViewedManager: RecentlyViewedManagerProtocol
    private let savedItemsManager: SavedItemsManagerProtocol
    private let brandsManager: BrandsManagerProtocol
    private let habitsManager: HabitsManagerProtocol
    
    var coordinator: CoordinatorProtocol
    
    init(productsManager: ProductsManagerProtocol,
         offersManager: OffersManagerProtocol,
         categoriesManager: CategoriesManagerProtocol,
         recentlyViewedManager: RecentlyViewedManagerProtocol,
         savedItemsManager: SavedItemsManagerProtocol,
         brandsManager: BrandsManagerProtocol,
         habitsManager: HabitsManagerProtocol,
         coordinator: CoordinatorProtocol) {
        
        self.productsManager = productsManager
        self.offersManager = offersManager
        self.categoriesManager = categoriesManager
        self.recentlyViewedManager = recentlyViewedManager
        self.savedItemsManager = savedItemsManager
        self.brandsManager = brandsManager
        self.habitsManager = habitsManager
        self.coordinator = coordinator
        
    }
    
    func fetchProducts(completion: @escaping ([ProductModel]) -> Void) {
        productsManager.fetchProducts(completion: completion)
    }
    
    func fetchOffers(completion: @escaping ([OfferModel]) -> Void) {
        offersManager.fetchOffers(completion: completion)
    }
    
    func fetchCategories(completion: @escaping ([CategoryModel]) -> Void) {
        categoriesManager.fetchCategories(completion: completion)
    }
    
    func fetchRecentlyViewed(completion: @escaping ([RecentlyViewedModel]) -> Void) {
        recentlyViewedManager.fetchRecentlyViewed(completion: completion)
    }
    
    func fetchSavedItems(completion: @escaping ([SavedItemModel]) -> Void) {
        savedItemsManager.fetchSavedItems(completion: completion)
    }
    
    func fetchBrands(completion: @escaping ([BrandModel]) -> Void) {
        brandsManager.fetchBrands(completion: completion)
    }
    
    func fetchHabits(completion: @escaping ([HabitModel]) -> Void) {
        habitsManager.fetchHabits(completion: completion)
    }
    
}
