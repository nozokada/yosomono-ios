//
//  AccountView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct AccountView: View {

    @EnvironmentObject var authenticationService: AuthenticationService

    var body: some View {
        Group {
            if authenticationService.currentUser != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(AuthenticationService())
    }
}
