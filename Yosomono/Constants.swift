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
        static let textFieldBackgroundDark = Color(red: 41/255.0, green: 42/255.0, blue: 48/255.0, opacity: 1.0)
        static let textScanBackground = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 0.5)
    }

    struct Sizes {
        static let buttonCornerRadius: CGFloat = 15.0
        static let textFieldCornerRadius: CGFloat = 5.0
        static let itemAddButtonSize: CGFloat = 60.0
    }

    struct CollectionNames {
        static let users = "users"
        static let products = "products"
    }

    struct FieldNames {
        static let username = "username"
        static let createdAt = "createdAt"
        static let updatedAt = "updatedAt"
        static let upc = "upc"
        static let ean = "ean"
        static let title = "title"
        static let brand = "brand"
        static let description = "description"
    }

    struct BarcodeDigitCounts {
        static let UPC_A = 12
    }

    struct ApiUrls {
        static let upcitemdb = "https://api.upcitemdb.com/prod/trial"
    }

    struct RetailerNames {
        static let all = [
//            Albertsons LLC
            "Safeway",
            "Albertsons",
            "Vons",
            "Jewel-Osco",
            "Acme Markets",
            "Shaw's",
            "Andronico's",
            "Carrs",
            "Haggen",
            "Lucky",
            "Pavillions",
            "Randalls",
            "Star Market",
            "Tom Thumb",
            "United Supermarkets",

//            Amazon
            "Amazon",

//            Ahold Delhaize
            "Food Lion",
            "Stop & Shop",
            "Giant Food Stores",
            "Hannaford",
            "Giant Food",

//            Costco
            "Costco",

//            Kroger
            "Kroger",
            "Harris Teeter",
            "King Soopers",
            "Roundy's",
            "Smith's Food and Drug",
            "Fred Meyer",
            "QFC",
            "Ruler Foods",
            "Food 4 Less",
            "City Market",
            "Baker's",
            "Dillons",
            "Fry's",
            "Gerbes",
            "JayC Food Stores",
            "Mariano's Fresh Market",
            "Owen's",
            "Pay Less Super Markets",
            "Ralphs",

//            Target
            "Target",

//            Walmart
            "Walmart"
        ]
        .sorted()
    }
}
