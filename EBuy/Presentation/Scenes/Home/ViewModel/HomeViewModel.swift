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
    
    var coordinator: CoordinatorProtocol { get }
    
    init(with productsManager: ProductsManagerProtocol, and offersManager: OffersManagerProtocol, coordinator: CoordinatorProtocol)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let productsManager: ProductsManagerProtocol
    private let offersManager: OffersManagerProtocol
    var coordinator: CoordinatorProtocol
    
    init(with productsManager: ProductsManagerProtocol, and offersManager: OffersManagerProtocol, coordinator: CoordinatorProtocol) {
        self.productsManager = productsManager
        self.offersManager = offersManager
        self.coordinator = coordinator
    }
    
    func fetchProducts(completion: @escaping ([ProductModel]) -> Void) {
        productsManager.fetchProducts(completion: completion)
    }
    
    func fetchOffers(completion: @escaping ([OfferModel]) -> Void) {
        offersManager.fetchOffers(completion: completion)
    }
    
}
