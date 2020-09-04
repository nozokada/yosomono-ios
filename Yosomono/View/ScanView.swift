//
//  ScanView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/20/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ScanView: View {
    
    @Binding var isPresented: Bool
    @Binding var scannedCode: String
    @Binding var productName: String
    
    @State var foundProducts: [Product] = []
    
    var body: some View {
        ZStack {
            CodeScanner(
                codeTypes: [.upce, .ean8, .ean13],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.lookupProduct(code)
                    }
                }
            )
            VStack() {
                Text("商品のバーコードをスキャンしてください")
                    .font(.headline)
                    .foregroundColor(Constants.Colors.themeBlue)
                    .padding()
                    .background(Constants.Colors.textScanBackground)
                    .cornerRadius(Constants.Sizes.textFieldCornerRadius)
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Spacer()
            }
        }
    }
    
    func lookupProduct(_ code: String) {
        UPCService().lookup(upc: code) { products in
            self.foundProducts = products
            if let product = products.first {
                self.productName = product.title
            }
            self.isPresented = false
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(isPresented: .constant(true), scannedCode: .constant(""), productName: .constant(""))
    }
}
