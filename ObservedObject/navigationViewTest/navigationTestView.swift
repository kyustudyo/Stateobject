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
                navOk = false
                print(navOk)
            } label: {
                Text("navOk = false")
            }

            Button {
                nextView = true
            } label: {
                Text("nextView = true")
            }
            //새로운 네비게이션뷰가 있어야 들어가서 나올때 동작한다. 들어가는건됨.
            NavigationLink(isActive: $nextView) {
                navView1(nextView:$nextView,navOk:$navOk)
            } label: {
                
            }


            
        }
                
    }
}

//struct navigationTest_Previews: PreviewProvider {
//    static var previews: some View {
//        navigationTestView()
//    }
//}
