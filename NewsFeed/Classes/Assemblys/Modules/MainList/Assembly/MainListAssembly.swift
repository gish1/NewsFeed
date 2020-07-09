//
//  MainListAssembly.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

typealias MainListModule = Module<MainListModuleInput, MainListModuleOutput>

class MainListAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> MainListModule {
        // View
        let view = MainListViewController.controllerFromStoryboard("MainList")
        
        // Interactor
        let interactor = MainListInteractor()
        
        // Router
        let router = MainListRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = MainListPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
