//
//  ItemAddView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/20/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ItemAddView: View {

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
            LargeTextField(placeholder: "商品名", text: $productName)
                            
            UploadImage()
            
            Spacer()
            
            .sheet(isPresented: $isPresentingScanner) {
                ScanView(isPresented: self.$isPresentingScanner, scannedCode: self.$scannedCode, productName: self.$productName)
            }
        }
        .padding()
    }
}

struct UploadImage: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var isPresentingCamera = false
    @State var productImage: UIImage? = nil
    
    var body: some View {
        ZStack {
            Rectangle()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(colorScheme == .dark
                                ? Constants.Colors.textFieldBackgroundDark
                                : Constants.Colors.textFieldBackground)
                .cornerRadius(Constants.Sizes.textFieldCornerRadius)
            Group {
                if productImage != nil {
                    
                } else {
                    Button(action: {
                        self.isPresentingCamera.toggle()
                    }) {
                        Text("商品の画像を撮影または選択する")
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentingCamera) {
            CameraView(isPresented: self.$isPresentingCamera, image: self.$productImage)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemAddView(isPresented: .constant(true))
    }
}
