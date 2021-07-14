//
//  OfferViewModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol OfferCatalogViewModelProtocol {
    
    func fetchOfferCatalog(completion: @escaping ([OfferCatalogModel]) -> Void)
    
    init(with offerCatalogManager: OfferCatalogManagerProtocol)
}

final class OfferCatalogViewModel: OfferCatalogViewModelProtocol {
    
    private let offerCatalogManager: OfferCatalogManagerProtocol
    
    init(with offerCatalogManager: OfferCatalogManagerProtocol) {
        self.offerCatalogManager = offerCatalogManager
    }
    
    func fetchOfferCatalog(completion: @escaping ([OfferCatalogModel]) -> Void) {
        self.offerCatalogManager.fetchOfferCalatog(completion: completion)
    }
    
}
