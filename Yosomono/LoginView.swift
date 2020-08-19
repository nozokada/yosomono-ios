//
//  LoginView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/17/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var message = ""
    
    @EnvironmentObject var authenticationService: AuthenticationService
    
    var body: some View {
        Group {
            if authenticationService.currentUser != nil {
                ProfileView()
            } else {
                VStack(spacing: 20) {
                    TextField("Eメールアドレス", text: $email)
                        .padding()
                        .background(Constants.Colors.textFieldBackground)
                        .cornerRadius(Constants.Sizes.textFieldCornerRadius)
                    SecureField("パスワード", text: $password)
                        .padding()
                        .background(Constants.Colors.textFieldBackground)
                        .cornerRadius(Constants.Sizes.textFieldCornerRadius)
                    Text(message).foregroundColor(.red).lineLimit(1).minimumScaleFactor(0.5)
                    Button(action: login) {
                        LoginButtonContentView()
                    }
                }.padding()
            }
        }
    }
    
    func login() {
        authenticationService.signIn(email: email, password: password) { success, message in
            if !success, let message = message {
                self.message = message
            }
            else {
                self.email = ""
                self.password = ""
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthenticationService())
    }
}
