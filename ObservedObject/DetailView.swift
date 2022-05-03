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
                .overlay(
                    
                                Text("WWDC Student challenge 에 참여했습니다. \n 쉽지 않더구만요.")
                                    .fontWeight(.heavy)
                                    .lineSpacing(10.0)
                                    .foregroundColor(.white)
                                    .font(.system(.title2, design: .rounded))
                                    .padding(20)
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .opacity(0.4)
                                    
                                    .padding(),
                                alignment: .center
                            )
        }
        .navigationTitle(Text("Info"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(Information())
    }
}
