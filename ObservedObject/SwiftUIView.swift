//
//  SwiftUIView.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/05/03.
//

import SwiftUI
//What’s happening is that SwiftUI automatically considers landscape navigation views to form a primary-detail split view, where two screens can be shown side by side. Again, this only happens on large iPhones and iPads when there is enough space, but it’s still often enough to be confusing.
//https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui
struct SwiftUIView: View {
    var body: some View {
        NavigationView{
            Text("Hell!")
            Text("hihi")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUIView()
                .previewInterfaceOrientation(.portraitUpsideDown)
            SwiftUIView()
                .previewDevice("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeRight)
            SwiftUIView()
                .previewDevice("iPad Air (4th generation)")
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
