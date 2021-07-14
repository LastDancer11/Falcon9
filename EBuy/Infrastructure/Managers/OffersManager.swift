//
//  OffersManager.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol OffersManagerProtocol: AnyObject {
    func fetchOffers(completion: @escaping ([OfferModel]) -> Void)
}

class OffersManager: OffersManagerProtocol {
    func fetchOffers(completion: @escaping ([OfferModel]) -> Void) {
        let url = "https://run.mocky.io/v3/be7c4bb2-56c0-455d-a4a7-bf0798d17bf4"
        NetworkManager.shared.get(url: url) { (result: Result<[OfferModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}

