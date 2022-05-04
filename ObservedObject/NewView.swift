//
//  NewView.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/04.
//

import SwiftUI

struct NewView: View {
    @Binding var isTenCountReady : Bool
    @State var nextView :Bool = false
    @State private var selection: String?
    var body: some View {
        
//Only works when there is one navigation per one isActive or tag.
        NavigationView{
        VStack{
            Button(action: {isTenCountReady = false}, label: {
                Text("isTenCountReady = false")
            })
            Button(action: {nextView = true}) {
                Text("nextView = true")
            }
            Button(action: {selection = "NewView2"}){
                Text("Go newVIew2 using tag")
            }
            
            NavigationLink(destination: NewView2(isTenCountReady: $isTenCountReady, nextView: $nextView,selection: $selection), label: {Text("without isActive")})
            
            NavigationLink(isActive: $nextView, destination: {
                NewView2(isTenCountReady: $isTenCountReady, nextView: $nextView,selection: $selection)
                
                    .onDisappear {
                        print("isTen:",isTenCountReady)
                    }
                    .onAppear {
                        print("isTen:",isTenCountReady)// Even if it is not commanded for 'isTenCountReady' to be false, it does so automatically.
                    }
            }, label: {Text("")})
            NavigationLink(destination: NewView2(isTenCountReady: $isTenCountReady, nextView: $nextView, selection: $selection), tag: "NewView2", selection: $selection) {
                Text("")
            }
        }
    }
    }
}
