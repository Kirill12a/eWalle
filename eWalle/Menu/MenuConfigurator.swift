//
//  MenuConfigurator.swift
//  eWalle
//
//  Created by Kirill Drozdov on 14.06.2022.
//

import Foundation

protocol MenuConfiguratorProtocol: AnyObject {
    func configure(with viewController: MenuViewController)
    
}

class MenuConfigurator: MenuConfiguratorProtocol {
    func configure(with viewController: MenuViewController) {
        let presenter = MenuViewPresenter(view: viewController)
        viewController.presenter = presenter
        
    }
}
