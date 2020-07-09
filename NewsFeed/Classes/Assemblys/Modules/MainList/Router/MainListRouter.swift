//
//  MainListRouter.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class MainListRouter: BaseModuleRouter, MainListRouterProtocol {
    func showInformation(model: NewsViewModel) {
        let module = container.resolve(InformationAssembly.self).build(coordinator: coordinator)
        coordinator.router.push(module)
        module.input.setDetailModel(model: model)
    }
    
    func showCategory(model: [NewsViewModel]) {
        let module = container.resolve(CategoriesListAssembly.self).build(coordinator: coordinator)
        coordinator.router.present(module, style: .popover)
        module.input.setCategoryModel(model: model)
    }
}
