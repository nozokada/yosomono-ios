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
    
    var body: some View {
        ZStack {
            CodeScannerView(
                codeTypes: [.upce, .ean8, .ean13],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresented = false
                    }
                }
            )
            VStack() {
                Text("商品のバーコードをスキャンしてください")
                    .font(.headline)
                    .foregroundColor(.white)
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
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(isPresented: .constant(true), scannedCode: .constant(""))
    }
}
