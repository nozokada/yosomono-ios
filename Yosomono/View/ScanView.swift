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
    @Binding var product: Product
    
    @State var foundProducts: [Product] = []
    
    var body: some View {
        ZStack {
            CodeScanner(
                codeTypes: [.upce, .ean13, .ean8],
                completion: { result in
                    if case let .success(code) = result {
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
        UPCService().lookup(code: code) { products in
            self.foundProducts = products
            if let product = products.first {
                self.product = product
            } else {
                self.product = Product(code: code)
            }
            self.isPresented = false
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(isPresented: .constant(true), product: .constant(Product()))
    }
}
