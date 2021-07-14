//
//  CoordinatorProtocol.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func popVC()
    func navigateToOfferCatalog(with navName: String)
    func presentSortOptions()
}

extension CoordinatorProtocol {
    func start() {}
    func navigateToOfferCatalog(with navName: String) {}
    func presentSortOptions() {}
    
}
