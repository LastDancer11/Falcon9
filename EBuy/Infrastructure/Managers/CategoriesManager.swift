//
//  CategoryManager.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol CategoriesManagerProtocol: AnyObject {
    func fetchCategories(completion: @escaping ([CategoryModel]) -> Void)
}

class CategoriesManager: CategoriesManagerProtocol {
    func fetchCategories(completion: @escaping ([CategoryModel]) -> Void) {
        let url = "https://run.mocky.io/v3/9ef77129-0d86-4023-b1e7-64571f1c8a4b"
        NetworkManager.shared.get(url: url) { (result: Result<[CategoryModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}
