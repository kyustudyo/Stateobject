//
//  ContentView.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/04/27.
//

import SwiftUI

class CountViewModel: ObservableObject {
    
  @Published var count: Int = 0
    
  init() {
    print("ViewModel init!")
  }
    
  func addCount() {
    count += 1
  }
    
}

struct ContentView: View {
    
    @State private var rootCount: Int = 0
    var body: some View {
        VStack{
            CountView(rootCount: rootCount)
            Button(action: {rootCount += 1}, label: {
                Text("Root Add")
            })
        }
    }
}

struct CountView: View {
    @ObservedObject var viewModel = CountViewModel()
    init(rootCount:Int){
        self.rootCount = rootCount
        print("init~")
    }
    
    let rootCount: Int
    
    var body: some View {
        VStack {
            Text("Root: \(rootCount)")
            Text("Count: \(viewModel.count)")
            Button(action: {viewModel.addCount()}, label: {
                Text("Countedr Add")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
