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
            Image("sc2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.3)
                .overlay(
                    
                                Text("WWDC Student challenge 에 참여했습니다. \n 쉽지 않더구만요.")
                                    .fontWeight(.bold)
                                    .lineSpacing(25.0)
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .background(Color.black)
                                    .cornerRadius(15)
                                    .opacity(0.7)
                                    .padding(),
                                alignment: .center
                            )
        }
        .navigationTitle(Text("My WWDC challenge"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(Information())
    }
}
