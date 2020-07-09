//
//  CategoriesListRouter.swift
//  NewsFeed
//
//  Created by Пк on 08.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class CategoriesListRouter: BaseModuleRouter, CategoriesListRouterProtocol {
    func showMainList(category: String) {
        let module = container.resolve(MainListAssembly.self).build(coordinator: coordinator)
        coordinator.router.setRootModule(module)
        coordinator.router.dismissModule()
        module.input.setCategory(category: category)
    }
}
