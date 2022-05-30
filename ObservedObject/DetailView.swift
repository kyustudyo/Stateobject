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
            Image(systemName: "circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.3)
                .overlay(
                    VStack{
                        //child부터 바깥쪽으로 물어보면서 layout진행됨.
                        Text("fggffg")
                            .foregroundColor(.red)
                            .padding(.leading,150)
                            .background(.white)
                            .frame(width:300,height:200)
                            .background(Color.cyan)
                            .padding()
                            .background(.yellow)
                            Button(action: {
                                showingSheetView = true
                            }){
                                HStack{
                                    Text("sheet, ispresented?")
                                }
                            }
                            .sheet(isPresented: $showingSheetView) {
                                sheetView(name: "kyu")
                            }
                            
                            Button(action: {
                                showingFullView = true
                            }){
                                HStack{
                                    Text("fullscreencover")
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
        .navigationTitle(Text(",,"))
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
