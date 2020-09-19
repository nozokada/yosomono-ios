//
//  ViewModel.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation

protocol ViewModel: ObservableObject {
    associatedtype StateType
    associatedtype Event

    var state: StateType { get set }

    func notify(event: Event)
}
