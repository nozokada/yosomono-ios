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
    @State var retailerName: String = ""
    
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
                            
            SelectedImagesView()
            
            LargeTextField(placeholder: "小売店名", text: $retailerName)
            
            LargeTextField(placeholder: "コメント", text: $retailerName)
            
            Button(action: submit) {
                LargeButtonContentView(title: "投稿")
            }
            
            Spacer()
            
            .sheet(isPresented: $isPresentingScanner) {
                ScanView(isPresented: self.$isPresentingScanner, scannedCode: self.$scannedCode, productName: self.$productName)
            }
        }
        .padding()
    }
    
    func submit() {
        print("submit")
    }
}

struct SelectedImagesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var isPresentingCamera = false
    @State var productImages: [UIImage]? = nil
    
    let rows = [
        GridItem(.fixed(180))
    ]
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 200)
                    .foregroundColor(colorScheme == .dark
                                    ? Constants.Colors.textFieldBackgroundDark
                                    : Constants.Colors.textFieldBackground)
                    .cornerRadius(Constants.Sizes.textFieldCornerRadius)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 20) {
                        ForEach(productImages ?? [UIImage](), id: \.self) { item in
                            Image(uiImage: item)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding()
                }
                .frame(height: 200)
            }
            Button(action: {
                self.isPresentingCamera.toggle()
            }) {
                Text("商品の画像を撮影または選択する（\(productImages?.count ?? 0)枚選択中）")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        }
        .fullScreenCover(isPresented: $isPresentingCamera) {
            CameraView(images: self.$productImages, isPresented: self.$isPresentingCamera)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemAddView(isPresented: .constant(true))
        SelectedImagesView(isPresentingCamera: false, productImages: [UIImage(named: "ramen")!])
    }
}
