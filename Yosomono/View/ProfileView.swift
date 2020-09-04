//
//  ProfileView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/17/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authenticationService: AuthenticationService
    
    var body: some View {
        VStack {
            Text("こんにちは、\(authenticationService.currentUser?.displayName ?? "名無し")さん")
                .font(.headline)
                .padding()
            Button(action: logout) {
                LargeButtonContentView(title: "ログアウト")
            }
        }.padding()
    }
    
    func logout() {
        authenticationService.signOut()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthenticationService())
    }
}
