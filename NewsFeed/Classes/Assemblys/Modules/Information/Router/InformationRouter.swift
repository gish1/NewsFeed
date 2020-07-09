//
//  InformationRouter.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class InformationRouter: BaseModuleRouter, InformationRouterProtocol {
    func popModule() {
        coordinator.router.popModule(animated: true)
    }
}
