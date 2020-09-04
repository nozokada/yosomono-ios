//
//  LargeTextField.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/23/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct LargeTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var placeholder: String = ""
    
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(colorScheme == .dark
                            ? Constants.Colors.textFieldBackgroundDark
                            : Constants.Colors.textFieldBackground)
            .cornerRadius(Constants.Sizes.textFieldCornerRadius)
    }
}

struct LargeTextField_Previews: PreviewProvider {
    static var previews: some View {
        LargeTextField(placeholder: "Some Text", text: .constant(""))
    }
}
