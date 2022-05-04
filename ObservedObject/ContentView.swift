//
//  ContentView.swift
//  ObservedObject
//
//  Created by Hankyu Lee on 2022/04/27.
//

//Question1_ how to add some words to String in the detail view like hi1, hi2 ... not hi12345...
//ignore screen shot

//선언적 UI 시대의 대규모 어플리케이션 개발에서 우리가 정말로 원했던 것은, MVI(단방향 데이터플로우)나 Flux(The composable architecture), Store/Provider 패턴 등이 아닐까 생각합니다.
//https://gist.github.com/unnnyong/439555659aa04bbbf78b2fcae9de7661

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
    @State private var isTenCountReady = false
    @State private var selection: String?
    @State private var navOk = false
    @StateObject var infomation: Information = Information()//because it is not view, it doesn't proceed reinitializing even if 'State' changes.
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
//                CountView(rootCount: rootCount)//view
                Group{
                CountView(selection: $selection, rootCount: rootCount)
                
                Button(action: {
                    rootCount += 1
                    //Although the color changes, data maintains if it used with StateObject.
                    update.toggle()
                    infomation.info += "\(rootCount)"
                }, label: {
                    Text("Root add")
                        .foregroundColor(update == true ? .red : .yellow)
                })
            }
                Spacer()
                
                //After 2 seconds, DetailView dismisses. Using @environment.
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
                
                
                //After 2 seconds, the view gets back.
                NavigationLink(destination: normalView(selection: $selection), tag: "Normal add tapped", selection: $selection){
                    Text("")
                }.onAppear {
                    print(selection)
//                    print(isNormalViewReady)
                }
                Button("If you tapped normal add button.."){
                    if self.selection == "Normal add" {
                        selection = "Normal add tapped"
                    }
                }
                
                //according to the situation, you can go to another view.
                NavigationLink(isActive: $isTenCountReady, destination: {
//                    Text("second view")
                    NewView(isTenCountReady: $isTenCountReady)
                        .onDisappear {
                            print("isTen:",isTenCountReady)
                        }
                        .onAppear {
                            print("isTen:",isTenCountReady)// Even if it is not commanded for 'isTenCountReady' to be false, it does so automatically.
                        }
                }, label: {Text("")})
                
                Button("If you make RootCount == 10...") {
                    if rootCount == 10{
                        self.isTenCountReady = true
                        
                    }
                }
                
                Group{
                    NavigationLink {
                        navigationTestView(navOk: $navOk)
                    } label: {
                        Text("Direct navigationTestView")
                    }
                    
                    HStack{
                        NavigationLink(isActive: $navOk) {
                            navigationTestView(navOk: $navOk)
                        } label: {
                            Text("")
                        }

                        Button {
                            navOk = true
                        } label: {
                            Text("navok = true")
                        }

                    }
                }
                
               
                
                Spacer()
                
                    .toolbar {
                        ToolbarItem(placement:.principal) {
                            HStack{
                                Image("jj")
        //                            .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:30)
                                    .clipShape(Circle())
                                Text("Let's study")
                            }
                        }
                    }
                
                
                
            }
            .navigationBarTitleDisplayMode(.large)
            
        }.environmentObject(infomation)
    }
}

//CountView is initialized whenever the parentview 'Contentview' is updated due to 'state' property wrapper in 'Contentview'. But because viewModel is initialized with StateObject, viewModel doesn't reinitialized again.

struct CountView: View {
    @StateObject var viewModel = CountViewModel()
    @Binding var selection: String?
//    init(rootCount:Int){
//        self.rootCount = rootCount
//        print("init~")
//    }
    let rootCount: Int
    
    var body: some View {
        VStack {
            Text("NormalCount: \(viewModel.count)")
            Text("RootCount: \(rootCount)")
            Button(action: {
                selection = "Normal add"
                viewModel.addCount()
            }, label: {
                Text("Normal add")
                    .foregroundColor(selection == "Normal add" ? .red : .yellow)
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
