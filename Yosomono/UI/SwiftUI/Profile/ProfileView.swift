//
//  ProfileView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/17/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ProfileView: View {

    var viewModel: ProfileViewModel
    @ObservedObject var state: ProfileViewModel.State

    @EnvironmentObject var authState: AuthenticationState

    init() {
        viewModel = ProfileViewModel()
        state = viewModel.state
    }

    var body: some View {
        if authState.loggedInUser != nil {
            VStack {
                Text("こんにちは、\(authState.loggedInUser?.displayName ?? "名無し")さん")
                    .font(.headline)
                    .padding()
                Button(action: logout) {
                    ButtonContentView(title: "ログアウト")
                }
            }.padding()
        } else {
            LoginView()
        }
    }

    func logout() {
        authState.signOut()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthenticationState())
    }
}
