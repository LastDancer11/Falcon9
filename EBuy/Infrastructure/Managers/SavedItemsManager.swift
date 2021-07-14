//
//  SavedItemsManager.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol SavedItemsManagerProtocol: AnyObject {
    func fetchSavedItems(completion: @escaping ([SavedItemModel]) -> Void)
}

class SavedItemsManager: SavedItemsManagerProtocol {
    func fetchSavedItems(completion: @escaping ([SavedItemModel]) -> Void) {
        let url = "https://run.mocky.io/v3/3b06cd4c-0486-4758-9446-ca66bdb04c72"
        NetworkManager.shared.get(url: url) { (result: Result<[SavedItemModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}
