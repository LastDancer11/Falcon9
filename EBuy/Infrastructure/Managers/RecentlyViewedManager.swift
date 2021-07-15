//
//  RecentlyViewedManager.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol RecentlyViewedManagerProtocol: AnyObject {
    func fetchRecentlyViewed(completion: @escaping ([RecentlyViewedModel]) -> Void)
}

class RecentlyViewedManager: RecentlyViewedManagerProtocol {
    func fetchRecentlyViewed(completion: @escaping ([RecentlyViewedModel]) -> Void) {
        let url = "https://run.mocky.io/v3/128ee9b1-c6b2-4815-b78c-b07a8956c936"
        NetworkManager.shared.get(url: url) { (result: Result<[RecentlyViewedModel], Error>) in
            switch result {
            case .success(let books):
                completion(books)
            case .failure(let error):
                print(error)
            }
        }
    }
}
