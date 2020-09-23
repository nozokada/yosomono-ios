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

    @EnvironmentObject var authState: AuthenticationState

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                LargeTextField(placeholder: "Eメールアドレス", text: $email)
                LargeSecureField(placeholder: "パスワード", text: $password)

                Text(authState.error?.localizedDescription ?? "")
                    .foregroundColor(.red)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)

                Button(action: signIn) {
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

    func signIn() {
        authState.signIn(with: .signInWithEmailAndPassword(email, password))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthenticationState())
    }
}
