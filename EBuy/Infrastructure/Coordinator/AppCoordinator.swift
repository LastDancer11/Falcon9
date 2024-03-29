//
//  AppCoordinator.swift
//  EBuy
//
//  Created by user200328 on 7/13/21.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {

    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
        
    // MARK: - Init
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = TabBarController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
}


