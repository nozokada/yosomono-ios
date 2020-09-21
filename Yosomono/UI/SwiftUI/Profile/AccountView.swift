//
//  AccountView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct AccountView: View {

    @EnvironmentObject var authState: AuthenticationState

    var body: some View {
        if authState.loggedInUser != nil {
            ProfileView()
        } else {
            LoginView()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
