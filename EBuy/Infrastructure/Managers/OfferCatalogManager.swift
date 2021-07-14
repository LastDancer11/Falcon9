//
//  OfferCatalogManager.swift
//  EBuy
//
//  Created by user200328 on 7/14/21.
//

import Foundation

protocol OfferCatalogManagerProtocol: AnyObject {
    func fetchOfferCalatog(completion: @escaping ([OfferCatalogModel]) -> Void)
}

class OfferCatalogManager: OfferCatalogManagerProtocol {
    func fetchOfferCalatog(completion: @escaping ([OfferCatalogModel]) -> Void) {
        let url = "https://run.mocky.io/v3/99d755a2-3009-4dc9-9cbb-86160e776442"
        NetworkManager.shared.get(url: url) { (result: Result<[OfferCatalogModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}
