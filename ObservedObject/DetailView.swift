//
//  DetailView.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/02.
//

import Foundation
import SwiftUI

struct DetailView : View {
    @EnvironmentObject var information : Information
    var body: some View {
        VStack{
            Text("\(information.info)")
        }
    }
}
