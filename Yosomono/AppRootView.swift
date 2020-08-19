//
//  AppRootView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/17/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct AppRootView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("Home View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("")
                    }
                }
                .tag(0)
            Text("Search View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("")
                    }
                }
                .tag(1)
            Text("Saved View")
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "heart.fill")
                    Text("")
                }
            }
            .tag(2)
            AccountView()
            .tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("")
                }
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView().environmentObject(AuthenticationService())
    }
}