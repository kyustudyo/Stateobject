//
//  make10View.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/03.
//

import Foundation
import SwiftUI

struct normalView : View{
    @Binding var selection : String?
    var body: some View {
        
        VStack {
            Text("normalView")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                selection = "plz get out of normalView"
//                selection = "Normal add tapped" // if it is written like this, it would not change the view because it is the same.
            }
        }
        
    }
}
