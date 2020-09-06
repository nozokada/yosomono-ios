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
            LargeTextField(placeholder: "ユーザー名", text: $username)
            LargeTextField(placeholder: "Eメールアドレス", text: $email)
            LargeSecureField(placeholder: "パスワード", text: $password)
            LargeSecureField(placeholder: "パスワードをもう一度入力", text: $passwordAgain)
            
            Text(message).foregroundColor(.red).lineLimit(1).minimumScaleFactor(0.5)
            
            Button(action: register) {
                ButtonContentView(title: "登録")
            }
        }
        .padding()
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
