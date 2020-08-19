//
//  LoginButtonContentView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct LoginButtonContentView: View {
    var body: some View {
        Text("ログイン")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Constants.Colors.themeBlue)
            .cornerRadius(Constants.Sizes.buttonCornerRadius)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonContentView()
    }
}
