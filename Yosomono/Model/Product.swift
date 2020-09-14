//
//  Product.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/22/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation

class Product {

    var upc: String
    var ean: String
    var title = ""
    var brand = ""
    var description = ""

    init() {
        upc = ""
        ean = ""
    }

    init(code: String) {
        if code.count == Constants.BarcodeDigitCounts.UPC_A {
            upc = code
            ean = "0\(code)"
        } else {
            upc = code
            ean = code
        }
    }

    init?(json: [String: Any]) {
        guard let ean = json["upc"] as? String,
            let upc = json["ean"] as? String,
            let title = json["title"] as? String,
            let brand = json["brand"] as? String
        else {
            return nil
        }
        self.upc = upc
        self.ean = ean
        self.title = title
        self.brand = brand
    }
}
