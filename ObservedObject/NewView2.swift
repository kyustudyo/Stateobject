//
//  NewView2.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/04.
//

import SwiftUI

struct NewView2: View {
    @Binding var isTenCountReady : Bool
    @Binding var nextView : Bool
    @Binding var selection : String?
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack{
            Button(action: {isTenCountReady = false}) {
                Text("isTenCountReady = false")
            }
            
            //Only works when there is one navigation per one isActive. It means that for the below tow codes to work, the previous view has to have a new navigation view.
            //In other words, isActive and selection do not work.
            
            Button(action: {nextView = false}) {
                Text("nextView = false")
            }
            
            Button(action: {selection = ";;"}) {
                Text("Change tag")
            }
            
        }
    }
}

//struct NewView2_Previews: PreviewProvider {
//    static var previews: some View {
//        NewView2()
//    }
//}
