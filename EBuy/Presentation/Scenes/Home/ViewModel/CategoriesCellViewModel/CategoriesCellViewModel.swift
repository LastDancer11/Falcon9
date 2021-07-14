//
//  CategoryCellViewModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol CategoriesCellViewModelProtocol {
    
    func fetchCategoroes(completion: @escaping ([CategoryModel]) -> Void)
    
    init(with categoriesManager: CategoriesManagerProtocol)
}

final class CategoriesCellViewModel: CategoriesCellViewModelProtocol {
    
    private let categoriesManager: CategoriesManagerProtocol
    
    init(with categoriesManager: CategoriesManagerProtocol) {
        self.categoriesManager = categoriesManager
    }
    
    func fetchCategoroes(completion: @escaping ([CategoryModel]) -> Void) {
        categoriesManager.fetchCategories(completion: completion)
    }
    
}
