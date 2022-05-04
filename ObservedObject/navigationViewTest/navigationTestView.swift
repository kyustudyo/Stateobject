//
//  navigationTest.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/04.
//

import SwiftUI

struct navigationTestView: View {
    @Binding var navOk : Bool 
    @State var nextView : Bool = false
    var body: some View {
        
            
        VStack{
            Button {
                nextView = true
            } label: {
                Text("nextView = true")
            }
            NavigationLink(isActive: $nextView) {
                navView1(nextView:$nextView,navOk:$navOk)
            } label: {
                //
            }


            
        }
                
    }
}

//struct navigationTest_Previews: PreviewProvider {
//    static var previews: some View {
//        navigationTestView()
//    }
//}