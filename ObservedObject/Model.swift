//
//  Model.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/02.
//

import Foundation
struct Music {
    
    var _EA: Int
    var EA: Int {
        get {
            return _EA
        }
        set {
            self._EA = newValue
        }
    }
}
