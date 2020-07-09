//
//  WeakContainer.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class WeakContainer<T> {
    fileprivate weak var _value: AnyObject?
    var value: T? {
        set { self._value = newValue as AnyObject }
        get { return _value as? T }
    }
    
    init(value: T) {
        self._value = value as AnyObject
    }
}
