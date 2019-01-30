//
//  AddItemToCartModel.swift
//  MagentoAPI
//
//  Created by Work on 1/22/17.
//  Copyright © 2017 TheMysteryPuzzles. All rights reserved.
//

import Foundation

class AddItemToCartJSONModel: Codable {
    let itemID: Int?
    let sku: String?
    let qty: Int?
    let name, productType, quoteID: String?
    
    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case sku, qty, name
        case productType = "product_type"
        case quoteID = "quote_id"
    }
    
    init(itemID: Int?, sku: String?, qty: Int?, name: String?, productType: String?, quoteID: String?) {
        self.itemID = itemID
        self.sku = sku
        self.qty = qty
        self.name = name
        self.productType = productType
        self.quoteID = quoteID
    }
}
