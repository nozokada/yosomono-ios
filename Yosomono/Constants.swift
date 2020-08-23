//
//  Constants.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/17/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation
import SwiftUI

struct Constants {
    
    struct Colors {
        static let themeBlue = Color(red: 114.0/255.0, green: 171.0/255.0, blue: 222.0/255.0, opacity: 1.0)
        static let textFieldBackground = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
        static let textScanBackground = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.5)
    }
    
    struct Sizes {
        static let buttonCornerRadius: CGFloat = 15.0
        static let textFieldCornerRadius: CGFloat = 5.0
    }
    
    struct CollectionNames {
        static let users = "users"
    }
    
    struct FieldNames {
        static let username = "username"
        static let createdAt = "createdAt"
    }
    
    struct Api {
        static let upcitemdb = "https://api.upcitemdb.com/prod/trial"
    }
}
