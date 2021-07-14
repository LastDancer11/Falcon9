//
//  BrandsManager.swift
//  EBuy
//
//  Created by user200328 on 7/14/21.
//

import Foundation

protocol BrandsManagerProtocol: AnyObject {
    func fetchBrands(completion: @escaping ([BrandModel]) -> Void)
}

class BrandsManager: BrandsManagerProtocol {
    func fetchBrands(completion: @escaping ([BrandModel]) -> Void) {
        let url = "https://run.mocky.io/v3/4360e4a1-8f87-4bb0-9bfc-fa381e4cc822"
        NetworkManager.shared.get(url: url) { (result: Result<[BrandModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}



