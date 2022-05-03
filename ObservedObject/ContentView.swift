//
//  ContentView.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/04/27.
//

//Question1_ how to add some words to String in the detail view like hi1, hi2 ... not hi12345...
//ignore screen shot

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
    init(){
        print("mainView init")
        //Although the properties with State wrapper change, it is only called once unlike ObservedObject.
    }
    //State + private ==> (Get into the habit)
    @State private var rootCount: Int = 0
    @State private var update = false
    @State private var goToSecView = false
    @StateObject var infomation: Information = Information()//because it is not view, it doesn't proceed reinitializing even if 'State' changes.
    
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                CountView(rootCount: rootCount)//view
                Button(action: {
                    rootCount += 1
                    //Although the color changes, data maintains if it used with StateObject.
                    update.toggle()
                    infomation.info += "\(rootCount)"
                }, label: {
                    Text("Root add")
                        .foregroundColor(update == true ? .red : .yellow)
                })
                Spacer()
                NavigationLink(destination: DetailView()){
                    HStack{
                        Image("jj")
//                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:30)
                            .clipShape(Circle())
                        Text("Show Detail View")
                    }
                }
                
                //according to the situation, you can go to another view.
                NavigationLink(isActive: $goToSecView, destination: {Text("second view")}, label: {Text("")})
                
                Button("If you make RootCount == 10...") {
                    if rootCount == 10{
                        self.goToSecView = true
                    }
                }
                Spacer()
            }
            .navigationTitle(Text("Let's study"))
            .navigationBarTitleDisplayMode(.large)
        }.environmentObject(infomation)
    }
}

//CountView is initialized whenever the parentview 'Contentview' is updated due to 'state' property wrapper in 'Contentview'. But because viewModel is initialized with StateObject, viewModel doesn't reinitialized again.

struct CountView: View {
    @StateObject var viewModel = CountViewModel()
    init(rootCount:Int){
        self.rootCount = rootCount
        print("init~")
    }
    let rootCount: Int
    
    var body: some View {
        VStack {
            Text("NormalCount: \(viewModel.count)")
            Text("RootCount: \(rootCount)")
            Button(action: {viewModel.addCount()}, label: {
                Text("Normal add")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// property wrapper
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-observedobject-to-manage-state-from-external-objects

//
