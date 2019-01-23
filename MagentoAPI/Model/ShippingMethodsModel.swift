//
//  ShippingMethodsModel.swift
//  MagentoAPI
//
//  Created by Work on 1/22/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

typealias ShipingMethodsModel = [ShipingMethodsModelElement]

struct ShipingMethodsModelElement: Codable {
    let carrierCode, methodCode, carrierTitle, methodTitle: String
    let amount, baseAmount: Int
    let available: Bool
    let extensionAttributes: ExtensionAttributes
    let errorMessage: String
    let priceExclTax, priceInclTax: Int
    
    enum CodingKeys: String, CodingKey {
        case carrierCode = "carrier_code"
        case methodCode = "method_code"
        case carrierTitle = "carrier_title"
        case methodTitle = "method_title"
        case amount
        case baseAmount = "base_amount"
        case available
        case extensionAttributes = "extension_attributes"
        case errorMessage = "error_message"
        case priceExclTax = "price_excl_tax"
        case priceInclTax = "price_incl_tax"
    }
}

