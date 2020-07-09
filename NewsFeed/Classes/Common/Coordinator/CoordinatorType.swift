//
//  CoordinatorType.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

protocol CoordinatorType: AnyObject, Presentable {
    var container: Container {get}
    var router: RouterType {get}
    var completion: (() -> Void)? {get set}
    
    func start()
    func start(with option: DeepLinkOption?)
}
