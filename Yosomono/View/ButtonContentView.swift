//
//  ButtonContentView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ButtonContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var title: String
    var width: CGFloat = 220
    var height: CGFloat = 60
    var font: Font = .headline
    
    var body: some View {
        Text(title)
            .font(font)
            .foregroundColor(.white)
            .padding()
            .frame(width: width, height: height)
            .background(Constants.Colors.themeBlue)
            .cornerRadius(Constants.Sizes.buttonCornerRadius)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonContentView(title: "ボタンのタイトル")
    }
}
