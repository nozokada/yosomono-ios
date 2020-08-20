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
            Text("Home View").tabItem {
                Image(systemName: "house.fill")
                Text("")
            }
            .tag(0)
            Text("Search View").tabItem {
                Image(systemName: "magnifyingglass")
                Text("")
            }
            .tag(1)
            Text("Add").tabItem {
                Image(systemName: "plus.circle.fill")
                Text("")
            }
            .tag(2)
            Text("Saved View").tabItem {
                Image(systemName: "heart.fill")
                Text("")
            }
            .tag(3)
            AccountView()
            .tabItem {
                Image(systemName: "person.fill")
                Text("")
            }
            .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView().environmentObject(AuthenticationService())
    }
}
