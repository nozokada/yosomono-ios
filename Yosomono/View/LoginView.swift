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
        NavigationView {
            VStack(spacing: 20) {
                LargeTextField(placeholder: "Eメールアドレス", text: $email)
                LargeSecureField(placeholder: "パスワード", text: $password)

                Text(message).foregroundColor(.red).lineLimit(1).minimumScaleFactor(0.5)

                Button(action: login) {
                    ButtonContentView(title: "ログイン")
                }
                NavigationLink(destination: RegisterView()) {
                    Text("登録")
                        .font(.headline)
                        .padding()
                }
            }
            .padding()
        }
    }

    func login() {
        authenticationService.signIn(email: email, password: password) { success, message in
            if !success, let message = message {
                self.message = message
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthenticationService())
    }
}
