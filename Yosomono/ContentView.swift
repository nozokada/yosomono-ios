//
//  RootView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/17/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("Home View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(0)
            Text("Search View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(1)
            Text("Saved View")
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "heart.fill")
                    Text("Saved")
                }
            }
            .tag(2)
            Text("Profile View")
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
