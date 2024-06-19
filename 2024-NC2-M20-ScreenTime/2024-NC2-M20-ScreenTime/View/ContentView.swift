//
//  ContentView.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = .main
        UITabBar.appearance().unselectedItemTintColor = .sub
    }
    
    @EnvironmentObject var cycleCountModel: CycleCountModel

    var body: some View {
        NavigationStack{
            TabView {
                Group{
                    MainView()
                        .tabItem {
                            Image(systemName: "rectangle.on.rectangle")
                            Text("투데이")
                        }
                    
                    Text("Another Tab")
                        .tabItem {
                            Image(systemName: "flame")
                            Text("성취")
                        }
                    
                    Text("The Last Tab")
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("내정보")
                        }
                }
            }
            .font(.headline)
        }.accentColor(.white)
    }
}

#Preview {
    ContentView()
}


//        UITabBar.appearance().backgroundColor = .main
//        UITabBar.appearance().unselectedItemTintColor = .sub
