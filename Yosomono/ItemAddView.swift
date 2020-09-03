//
//  ItemAddView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/20/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ItemAddView: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var isPresented: Bool
    
    @State var isPresentingScanner = true
    @State var scannedCode = ""
    @State var productName = ""
    @State var productImages = [UIImage]()
    @State var retailerName = ""
    @State var selectedRetailerNames = Set<String>()
    @State var comment = ""
    
    var body: some View {
        ScrollView {
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
                
                SelectedImagesView(images: $productImages)
                
                VStack {
                    LargeTextField(placeholder: "小売業者を検索", text: $retailerName)
                    SelectTagListView(tags: filterRetailerNames(name: retailerName),
                                      selectedTags: $selectedRetailerNames)
                }
                
                LargeTextField(placeholder: "コメント", text: $comment)
                
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
    }
    
    func filterRetailerNames(name: String) -> [String] {
        if name.isEmpty {
            return Constants.RetailerNames.major
        }
        
        let lowercasedName = name.lowercased()
        return Constants.RetailerNames.all.filter {
            $0.lowercased().contains(lowercasedName)
        }
    }
    
    func submit() {
        print("submit")
    }
}

struct SelectedImagesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var images: [UIImage]
    
    @State var isPresentingCamera = false
    
    let rows = [
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(images, id: \.self) { item in
                        Image(uiImage: item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding()
            }
            .frame(height: 120)
            Button(action: {
                self.isPresentingCamera.toggle()
            }) {
                Text("商品の画像を撮影または選択する（\(images.count)枚選択中）")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(.bottom)
        }
        .background(colorScheme == .dark
                        ? Constants.Colors.textFieldBackgroundDark
                        : Constants.Colors.textFieldBackground)
        .cornerRadius(Constants.Sizes.textFieldCornerRadius)
        
        .fullScreenCover(isPresented: $isPresentingCamera) {
            CameraView(images: self.$images, isPresented: self.$isPresentingCamera)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemAddView(isPresented: .constant(true))
        SelectedImagesView(images: .constant([UIImage(named: "ramen")!]))
    }
}
