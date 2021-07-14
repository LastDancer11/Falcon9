//
//  BrandsCellViewModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol BrandsCellViewModelProtocol {
    
    func fetchBrands(completion: @escaping ([BrandModel]) -> Void)
    
    init(with brandsManager: BrandsManagerProtocol)
}

final class BrandsCellViewModel: BrandsCellViewModelProtocol {
    
    private let brandsManager: BrandsManagerProtocol
    
    init(with brandsManager: BrandsManagerProtocol) {
        self.brandsManager = brandsManager
    }
    
    func fetchBrands(completion: @escaping ([BrandModel]) -> Void) {
        brandsManager.fetchBrands(completion: completion)
    }
    
}
