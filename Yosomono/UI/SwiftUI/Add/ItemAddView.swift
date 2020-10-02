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

    var viewModel: ItemAddViewModel
    @ObservedObject var state: ItemAddViewModel.State

    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented

        viewModel = ItemAddViewModel()
        state = viewModel.state
    }

    var body: some View {
        ScrollView {
            closeButton()
                .padding()

            VStack(spacing: 10) {
                barcodeReaderTextField()
                Divider()

                productNameTextField()
                Divider()

                SelectedImagesView(images: $state.productImages)
                Divider()

                retailersSelector()
                Divider()

                commentTextField()

                postButton()
                    .padding()
            }
            .padding()
        }
    }
}

extension ItemAddView {
    func closeButton() -> some View {
        HStack {
            Button(action: {
                isPresented.toggle()
            }, label: {
                Image(systemName: "xmark")
            })
            Spacer()
        }
    }

    func barcodeReaderTextField() -> some View {
        HStack {
            LargeTextField(placeholder: "バーコード", text: $state.product.upc)
            Button(action: {
                state.isPresentingScannerView.toggle()
            }, label: {
                Image(systemName: "barcode.viewfinder")
            })
            .padding()
            .sheet(isPresented: $state.isPresentingScannerView) {
                ScanView(isPresented: $state.isPresentingScannerView, product: $state.product)
            }
        }
    }

    func productNameTextField() -> some View {
        LargeTextField(placeholder: "商品名", text: $state.product.title)
    }

    func retailersSelector() -> some View {
        VStack(alignment: .leading) {
            Button(action: {
                state.isPresentingRetailersSelectView.toggle()
            }, label: {
                ButtonContentView(title: "+ 小売業者を追加", width: 180, height: 40, font: .body)
            })
            .sheet(isPresented: $state.isPresentingRetailersSelectView) {
                RetailersSelectView(isPresented: $state.isPresentingRetailersSelectView,
                                    selectedRetailerNames: $state.selectedRetailerNames)
            }
            RemovableTagListView(tags: $state.selectedRetailerNames)
        }
    }

    func commentTextField() -> some View {
        LargeTextField(placeholder: "コメント", text: $state.product.description)
    }

    func postButton() -> some View {
        Button(action: submit) {
            ButtonContentView(title: "投稿")
        }
    }

    func submit() {
        FirestoreService().uploadProduct(product: state.product) { _, error in
            if let error = error {
                print("Error uploading product \(error.localizedDescription)")
            } else {
                isPresented = false
            }
        }
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
            }, label: {
                Text("商品の画像を撮影または選択する（\(images.count)枚選択中）")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            })
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
