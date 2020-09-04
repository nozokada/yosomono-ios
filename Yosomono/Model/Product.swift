//
//  Product.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/22/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation

struct Product {
    
    var ean: String
    var upc: String
    var title: String
    var brand: String
    
}

extension Product {
    
    init() {
        ean = ""
        upc = ""
        title = ""
        brand = ""
    }
    
    init?(json: [String: Any]) {
        guard let ean = json["ean"] as? String,
            let upc = json["upc"] as? String,
            let title = json["title"] as? String,
            let brand = json["brand"] as? String
        else {
            return nil
        }
        
        self.ean = ean
        self.upc = upc
        self.title = title
        self.brand = brand
    }
}
