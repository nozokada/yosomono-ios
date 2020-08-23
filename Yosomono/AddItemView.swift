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
    @State var productName: String = ""
    
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
                    Image(systemName: "barcode.viewfinder")
                }.padding()
                .sheet(isPresented: $isPresentingScanner) {
                    ScanView(isPresented: self.$isPresentingScanner, scannedCode: self.$scannedCode, productName: self.$productName)
                }
            }
            TextField("商品名", text: $productName)
            .padding()
            .background(Constants.Colors.textFieldBackground)
            .cornerRadius(Constants.Sizes.textFieldCornerRadius)
        }.padding()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
