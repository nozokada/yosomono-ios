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
        
            ItemAddButton(isPresentingAddSheet: $isPresentingAddSheet)
                
            .fullScreenCover(isPresented: $isPresentingAddSheet) {
                ItemAddView(isPresented: $isPresentingAddSheet)
            }
        }
    }
}


struct ItemAddButton: View {
    
    @Binding var isPresentingAddSheet: Bool
    
    var body: some View {
        let buttonSize = Constants.Sizes.itemAddButtonSize
        
        Image(systemName: "plus.circle")
            .resizable()
            .foregroundColor(.white)
            .background(Constants.Colors.themeBlue)
            .cornerRadius(buttonSize / 2)
            .frame(width: buttonSize, height: buttonSize)
            .onTapGesture {
                self.isPresentingAddSheet.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView().environmentObject(AuthenticationService())
    }
}
