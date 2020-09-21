//
//  ProfileViewModel.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation

class ProfileViewModel {
    var state = State()
}

// MARK: - ViewModel Event and State
extension ProfileViewModel {
    enum Event {
    }

    class State: ObservableObject {
    }
}

// MARK: - Conform to ViewModel Protocol
extension ProfileViewModel: ViewModel {
    func notify(event: Event) {
    }
}
