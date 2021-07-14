//
//  ProductsManager.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol ProductsManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ([ProductModel]) -> Void)
}

class ProductsManager: ProductsManagerProtocol {
    func fetchProducts(completion: @escaping ([ProductModel]) -> Void) {
        let url = "https://fakestoreapi.com/products"
        NetworkManager.shared.get(url: url) { (result: Result<[ProductModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}
