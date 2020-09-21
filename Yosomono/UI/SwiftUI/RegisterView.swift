//
//  RegisterView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct RegisterView: View {

    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordAgain: String = ""

    @EnvironmentObject var authState: AuthenticationState

    var body: some View {
        VStack(spacing: 20) {
            LargeTextField(placeholder: "ユーザー名", text: $username)
            LargeTextField(placeholder: "Eメールアドレス", text: $email)
            LargeSecureField(placeholder: "パスワード", text: $password)
            LargeSecureField(placeholder: "パスワードをもう一度入力", text: $passwordAgain)

            Text(authState.error?.localizedDescription ?? "")
                .foregroundColor(.red)
                .lineLimit(1)
                .minimumScaleFactor(0.5)

            Button(action: register) {
                ButtonContentView(title: "登録")
            }
        }
        .padding()
    }

    func register() {
        authState.signUp(email: email, password: password, username: username)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
