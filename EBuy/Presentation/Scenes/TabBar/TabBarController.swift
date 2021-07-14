//
//  TabBarController.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    
    private let homeCoordinator = HomeCoordinator()
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers![0] = homeCoordinator.navigationController!
        
        let vc2 = self.viewControllers![1] as! SearchViewController
        vc2.coordinator = coordinator
        
        let vc3 = self.viewControllers![2] as! CartViewController
        vc3.coordinator = coordinator
        
        let vc4 = self.viewControllers![3] as! SavedItemsViewController
        vc4.coordinator = coordinator
        
        let vc5 = self.viewControllers![4] as! AccountViewController
        vc5.coordinator = coordinator
        
    }

}
