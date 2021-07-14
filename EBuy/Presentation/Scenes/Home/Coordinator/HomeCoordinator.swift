//
//  HomeCoordinator.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = HomeViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic-home")

        self.navigationController?.viewControllers = [vc]
    }
    
    func navigateToOfferCatalog(with navName: String) {
        let vc = OfferCatalogViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.isNavigationBarHidden = false
        vc.navigationItem.title = navName
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentSortOptions() {
        let vc = SortViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.isNavigationBarHidden = true
        
        self.navigationController?.present(vc, animated: false)
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

