//
//  SavedItemsCellViewModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol SavedItemsCellViewModelProtocol {
    
    func fetchSavedItems(completion: @escaping ([SavedItemModel]) -> Void)
    
    init(with savedItemsManager: SavedItemsManagerProtocol)
}

final class SavedItemsCellViewModel: SavedItemsCellViewModelProtocol {
    
    private let savedItemsManager: SavedItemsManagerProtocol
    
    init(with savedItemsManager: SavedItemsManagerProtocol) {
        self.savedItemsManager = savedItemsManager
    }
    
    func fetchSavedItems(completion: @escaping ([SavedItemModel]) -> Void) {
        savedItemsManager.fetchSavedItems(completion: completion)
    }
    
}
