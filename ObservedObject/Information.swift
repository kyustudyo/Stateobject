//
//  Information.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/02.
//

import Foundation

class Information: ObservableObject {
    init() {
        print("Info init")
    }
    @Published var info: String = "hi" 
}
