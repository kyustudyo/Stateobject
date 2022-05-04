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
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheetView: Bool = false
    @State private var showingFullView: Bool = false
    
    var body: some View {
        VStack{
            Image("sc2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.3)
                .overlay(
                    VStack{
                        
                        Text("저도 WWDC Student challenge 에 참여했습니다. \n 쉽지 않더구만요.")
                            .fontWeight(.bold)
                            .lineSpacing(25.0)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.black)
                            .cornerRadius(15)
                            .opacity(0.7)
                            .padding()
                        
                            Button(action: {
                                showingSheetView = true
                            }){
                                HStack{
                                    Text("Go Sheet")
                                }
                            }
                            .sheet(isPresented: $showingSheetView) {
                                sheetView(name: "kyu")
                            }
                            
                            Button(action: {
                                showingFullView = true
                            }){
                                HStack{
                                    Text("Go Full")
                                }
                            }
                            .fullScreenCover(isPresented: $showingFullView){
                                fullView()
                            }
                        
                    }
                    ,alignment: .center
                )
            


        }
        //After 2 seconds, it goes back.
//        .onAppear{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
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

struct sheetView : View{
    let name : String
    var body: some View {
        VStack{
            Text("Hi \(name)")
        }
    }
}

struct fullView : View{
    @Environment(\.presentationMode) var presentationMode
//    let name : String
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.yellow
                .ignoresSafeArea()
            VStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back").padding()
                }
            }
            
        }
    }
}
