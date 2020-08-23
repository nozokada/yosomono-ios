//
//  ItemUploadView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/20/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ItemUploadView: View {

    @Binding var isPresented: Bool
    
    @State var isPresentingScanner = true
    @State var scannedCode: String = ""
    @State var productName: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Image(systemName: "xmark")
                }
                Spacer()
            }
            
            HStack {
                LargeTextField(placeholder: "バーコード", text: $scannedCode)
                Button(action: {
                    self.isPresentingScanner.toggle()
                }) {
                    Image(systemName: "barcode.viewfinder")
                }
                .padding()
            }
            LargeTextField(placeholder: "商品", text: $productName)
            
            Spacer()
            
            .sheet(isPresented: $isPresentingScanner) {
                ScanView(isPresented: self.$isPresentingScanner, scannedCode: self.$scannedCode, productName: self.$productName)
            }
        }
        .padding()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemUploadView(isPresented: .constant(true))
    }
}
