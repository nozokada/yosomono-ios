//
//  FirestoreService.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/3/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation
import Firebase

class FirestoreService {
    
    func uploadProduct(product: Product, completion: @escaping (Bool, Error?) -> ()) {
        Firestore.firestore().collection(Constants.CollectionNames.products).document(product.upc).setData([
            Constants.FieldNames.ean: product.ean,
            Constants.FieldNames.upc: product.upc,
            Constants.FieldNames.title: product.title,
            Constants.FieldNames.brand: product.brand,
        ]) { error in
            if let error = error {
                #if DEBUG
                print("Failed to upload product with code \(product.upc)")
                #endif
                completion(false, error)
            } else {
                #if DEBUG
                print("Successfully uploaded product with code \(product.upc)")
                #endif
                completion(true, nil)
            }
        }
    }
}