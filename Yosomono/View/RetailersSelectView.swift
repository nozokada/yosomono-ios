//
//  RetailersSelectView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/5/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct RetailersSelectView: View {

    @Binding var isPresented: Bool
    @Binding var selectedRetailerNames: Set<String>

    @State var retailerName = ""

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
            LargeTextField(placeholder: "小売業者を検索", text: $retailerName)
            ScrollView {
                SelectableTagListView(selectedTags: $selectedRetailerNames,
                                      tags: Constants.RetailerNames.all,
                                      searchTerm: retailerName)
            }
        }
        .padding()
    }
//    
//    func filterRetailerNames(name: String) -> Set<String> {
//        if name.isEmpty {
//            return Constants.RetailerNames.all
//        }
//
//        let lowercasedName = name.lowercased()
//        return Constants.RetailerNames.all.filter {
//            $0.lowercased().contains(lowercasedName)
//        }
//    }
}

struct RetailersSelectView_Previews: PreviewProvider {
    static var previews: some View {
        RetailersSelectView(isPresented: .constant(true), selectedRetailerNames: .constant(["Target"]))
    }
}
