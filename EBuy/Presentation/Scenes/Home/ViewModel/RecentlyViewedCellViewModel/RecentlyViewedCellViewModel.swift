//
//  RecentlyViewedCellViewModel.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import Foundation

protocol RecentlyViewedCellViewModelProtocol {
    
    func fetchRecentlyViewed(completion: @escaping ([RecentlyViewedModel]) -> Void)
    
    init(with recentlyViewed: RecentlyViewedManagerProtocol)
}

final class RecentlyViewedCellViewModel: RecentlyViewedCellViewModelProtocol {
    
    private let recentlyViewed: RecentlyViewedManagerProtocol
    
    init(with recentlyViewed: RecentlyViewedManagerProtocol) {
        self.recentlyViewed = recentlyViewed
    }
    
    func fetchRecentlyViewed(completion: @escaping ([RecentlyViewedModel]) -> Void) {
        recentlyViewed.fetchRecentlyViewed(completion: completion)
    }
    
}
