//
//  AddItemView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/20/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct AddItemView: View {
    
    @State var isPresentingScanner = true
    @State var scannedCode: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("バーコード", text: $scannedCode)
                    .padding()
                    .background(Constants.Colors.textFieldBackground)
                    .cornerRadius(Constants.Sizes.textFieldCornerRadius)
                Button(action: {
                    self.isPresentingScanner.toggle()
                }) {
                    Image(systemName: "camera")
                }.padding()
                .sheet(isPresented: $isPresentingScanner) {
                    ScanView(isPresented: self.$isPresentingScanner, scannedCode: self.$scannedCode)
                }
            }
        }.padding()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
