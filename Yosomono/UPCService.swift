//
//  UPCService.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/22/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation
import Alamofire

class UPCService {
    
    func lookup(upc: String, completion: @escaping ([Product]) -> ()) {
        let requestUrl = "\(Constants.Api.upcitemdb)/lookup?upc=\(upc)"
        #if DEBUG
        print("Looking up given UPC \(upc)")
        #endif
        AF.request(requestUrl).responseJSON {response in
            completion(self.handleLookupResponse(response))
        }
    }
    
    fileprivate func handleLookupResponse(_ response: AFDataResponse<Any>) -> [Product] {
        var products = [Product]()
        switch response.result {
        case .success(let json):
            #if DEBUG
            print("Received JSON response: ", json)
            #endif
            guard let json = json as? [String: Any],
                let items = json["items"] as? [[String: Any]] else {
                return products
            }
            for case let item in items {
                if let product = Product(json: item) {
                    products.append(product)
                }
            }
        case .failure( _):
            #if DEBUG
            print("Failed to look up given UPC", response)
            #endif
        }
        return products
    }
}
