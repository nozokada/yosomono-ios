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
    @State var message = ""
    
    @EnvironmentObject var authenticationService: AuthenticationService
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("ユーザー名", text: $username)
                .padding()
                .background(Constants.Colors.textFieldBackground)
                .cornerRadius(Constants.Sizes.textFieldCornerRadius)
            TextField("Eメールアドレス", text: $email)
                .padding()
                .background(Constants.Colors.textFieldBackground)
                .cornerRadius(Constants.Sizes.textFieldCornerRadius)
            SecureField("パスワード", text: $password)
                .padding()
                .background(Constants.Colors.textFieldBackground)
                .cornerRadius(Constants.Sizes.textFieldCornerRadius)
            SecureField("パスワードをもう一度入力", text: $passwordAgain)
                .padding()
                .background(Constants.Colors.textFieldBackground)
                .cornerRadius(Constants.Sizes.textFieldCornerRadius)
            Text(message).foregroundColor(.red).lineLimit(1).minimumScaleFactor(0.5)
            Button(action: register) {
                LargeButtonContentView(title: "登録")
            }
        }.padding()
    }
    
    func register() {
        authenticationService.createUser(email: email, password: password, username: username) { success, message in
            if !success, let message = message {
                self.message = message
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(AuthenticationService())
    }
}
