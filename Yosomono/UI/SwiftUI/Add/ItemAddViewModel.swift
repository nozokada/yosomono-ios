//
//  ItemAddViewModel.swift
//  Yosomono
//
//  Created by Nozomi Okada on 10/1/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.4
//

import Foundation
import SwiftUI

class ItemAddViewModel {
    var state = State()
}

// MARK: - ViewModel Event and State
extension ItemAddViewModel {
    enum Event {
    }

    class State: ObservableObject {
        @Published var product = Product()
        @Published var productImages = [UIImage]()
        @Published var selectedRetailerNames = Set<String>()
        @Published var isPresentingScannerView = true
        @Published var isPresentingCameraView = false
        @Published var isPresentingRetailersSelectView = false
    }
}

// MARK: - Conform to ViewModel Protocol
extension ItemAddViewModel: ViewModel {
    func notify(event: Event) {
    }
}
