//
//  navView1.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/04.
//

import SwiftUI

struct navView1: View {
    @Binding var nextView : Bool
    @Binding var navOk : Bool
    var body: some View {
        VStack{
            Button {
                nextView = false
            } label: {
                Text("nextView = false")
            }
            Button {
                navOk = false
            } label: {
                Text("navOk = false")
            }
        }

    }
}

//struct navView1_Previews: PreviewProvider {
//    static var previews: some View {
//        navView1()
//    }
//}
