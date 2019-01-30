//
//  CartGrandTotalModel.swift
//  MagentoAPI
//
//  Created by Work on 1/24/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//


import Foundation

struct CartGrandTotalJSONModel: Codable {
    let grandTotal, baseGrandTotal, subtotal, baseSubtotal: Int
    let discountAmount, baseDiscountAmount, subtotalWithDiscount, baseSubtotalWithDiscount: Int
    let shippingAmount, baseShippingAmount, shippingDiscountAmount, baseShippingDiscountAmount: Int
    let taxAmount, baseTaxAmount: Int
    let weeeTaxAppliedAmount: JSONNull?
    let shippingTaxAmount, baseShippingTaxAmount, subtotalInclTax, shippingInclTax: Int
    let baseShippingInclTax: Int
    let baseCurrencyCode, quoteCurrencyCode: String
    let itemsQty: Int
    let items: [FinalItem]
    let totalSegments: [TotalSegment]
    
    enum CodingKeys: String, CodingKey {
        case grandTotal = "grand_total"
        case baseGrandTotal = "base_grand_total"
        case subtotal
        case baseSubtotal = "base_subtotal"
        case discountAmount = "discount_amount"
        case baseDiscountAmount = "base_discount_amount"
        case subtotalWithDiscount = "subtotal_with_discount"
        case baseSubtotalWithDiscount = "base_subtotal_with_discount"
        case shippingAmount = "shipping_amount"
        case baseShippingAmount = "base_shipping_amount"
        case shippingDiscountAmount = "shipping_discount_amount"
        case baseShippingDiscountAmount = "base_shipping_discount_amount"
        case taxAmount = "tax_amount"
        case baseTaxAmount = "base_tax_amount"
        case weeeTaxAppliedAmount = "weee_tax_applied_amount"
        case shippingTaxAmount = "shipping_tax_amount"
        case baseShippingTaxAmount = "base_shipping_tax_amount"
        case subtotalInclTax = "subtotal_incl_tax"
        case shippingInclTax = "shipping_incl_tax"
        case baseShippingInclTax = "base_shipping_incl_tax"
        case baseCurrencyCode = "base_currency_code"
        case quoteCurrencyCode = "quote_currency_code"
        case itemsQty = "items_qty"
        case items
        case totalSegments = "total_segments"
    }
}

struct FinalItem: Codable {
    let itemID, price, basePrice, qty: Int
    let rowTotal, baseRowTotal, rowTotalWithDiscount, taxAmount: Int
    let baseTaxAmount, taxPercent, discountAmount, baseDiscountAmount: Int
    let discountPercent, priceInclTax, basePriceInclTax, rowTotalInclTax: Int
    let baseRowTotalInclTax: Int
    let options: String
    let weeeTaxAppliedAmount, weeeTaxApplied: JSONNull?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case price
        case basePrice = "base_price"
        case qty
        case rowTotal = "row_total"
        case baseRowTotal = "base_row_total"
        case rowTotalWithDiscount = "row_total_with_discount"
        case taxAmount = "tax_amount"
        case baseTaxAmount = "base_tax_amount"
        case taxPercent = "tax_percent"
        case discountAmount = "discount_amount"
        case baseDiscountAmount = "base_discount_amount"
        case discountPercent = "discount_percent"
        case priceInclTax = "price_incl_tax"
        case basePriceInclTax = "base_price_incl_tax"
        case rowTotalInclTax = "row_total_incl_tax"
        case baseRowTotalInclTax = "base_row_total_incl_tax"
        case options
        case weeeTaxAppliedAmount = "weee_tax_applied_amount"
        case weeeTaxApplied = "weee_tax_applied"
        case name
    }
}

struct TotalSegment: Codable {
    let code, title: String
    let value: Int
    let extensionAttributes: GrantTotalExtensionAttributes?
    let area: String?
    
    enum CodingKeys: String, CodingKey {
        case code, title, value
        case extensionAttributes = "extension_attributes"
        case area
    }
}

struct GrantTotalExtensionAttributes: Codable {
    let taxGrandtotalDetails: [JSONAny]
    
    enum CodingKeys: String, CodingKey {
        case taxGrandtotalDetails = "tax_grandtotal_details"
    }
}
