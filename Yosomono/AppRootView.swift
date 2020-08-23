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
    @State private var isPresentingAddSheet = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection){
                Text("Home View").tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
                
                Text("Search View").tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
                
                Spacer()
                
                Text("Saved View").tabItem {
                    Image(systemName: "heart.fill")
                }
                .tag(2)
                
                AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(3)
            }
        
            ItemUploadButton(isPresentingAddSheet: $isPresentingAddSheet)
                
            .fullScreenCover(isPresented: $isPresentingAddSheet) {
                ItemUploadView(isPresented: $isPresentingAddSheet)
            }
        }
    }
}


struct ItemUploadButton: View {
    
    @Binding var isPresentingAddSheet: Bool
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                self.isPresentingAddSheet.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .background(Constants.Colors.themeBlue)
                    .cornerRadius(20)
            }
            .offset(x: geometry.size.width / 2 - 20, y: geometry.size.height - 46)
            .frame(width: 40, height: 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView().environmentObject(AuthenticationService())
    }
}
