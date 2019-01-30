//
//  CartInformationModel.swift
//  MagentoAPI
//
//  Created by Work on 1/28/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

struct CartInformationJSONModel: Codable {
    let id: Int?
    let createdAt, updatedAt: String?
    let isActive, isVirtual: Bool?
    let items: [JSONAny]?
    let itemsCount, itemsQty: Int?
    let customer: Customer?
    let billingAddress: BillingAddress?
    let origOrderID: Int?
    let currency: Currency?
    let customerIsGuest, customerNoteNotify: Bool?
    let customerTaxClassID, storeID: Int?
    let extensionAttributes: WelcomeExtensionAttributes?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isActive = "is_active"
        case isVirtual = "is_virtual"
        case items
        case itemsCount = "items_count"
        case itemsQty = "items_qty"
        case customer
        case billingAddress = "billing_address"
        case origOrderID = "orig_order_id"
        case currency
        case customerIsGuest = "customer_is_guest"
        case customerNoteNotify = "customer_note_notify"
        case customerTaxClassID = "customer_tax_class_id"
        case storeID = "store_id"
        case extensionAttributes = "extension_attributes"
    }
}

struct BillingAddress: Codable {
    let id: Int?
    let region, regionID, regionCode, countryID: JSONNull?
    let street: [String]?
    let telephone, postcode, city, firstname: JSONNull?
    let lastname: JSONNull?
    let customerID: Int?
    let email: String?
    let sameAsBilling, saveInAddressBook: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, region
        case regionID = "region_id"
        case regionCode = "region_code"
        case countryID = "country_id"
        case street, telephone, postcode, city, firstname, lastname
        case customerID = "customer_id"
        case email
        case sameAsBilling = "same_as_billing"
        case saveInAddressBook = "save_in_address_book"
    }
}

struct Currency: Codable {
    let globalCurrencyCode, baseCurrencyCode, storeCurrencyCode, quoteCurrencyCode: String?
    let storeToBaseRate, storeToQuoteRate, baseToGlobalRate, baseToQuoteRate: Int?
    
    enum CodingKeys: String, CodingKey {
        case globalCurrencyCode = "global_currency_code"
        case baseCurrencyCode = "base_currency_code"
        case storeCurrencyCode = "store_currency_code"
        case quoteCurrencyCode = "quote_currency_code"
        case storeToBaseRate = "store_to_base_rate"
        case storeToQuoteRate = "store_to_quote_rate"
        case baseToGlobalRate = "base_to_global_rate"
        case baseToQuoteRate = "base_to_quote_rate"
    }
}

struct Customer: Codable {
    let id, groupID: Int?
    let createdAt, updatedAt, createdIn, email: String?
    let firstname, lastname: String?
    let storeID, websiteID: Int?
    let addresses: [JSONAny]?
    let disableAutoGroupChange: Int?
    let extensionAttributes: CustomerExtensionAttributes?
    
    enum CodingKeys: String, CodingKey {
        case id
        case groupID = "group_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case createdIn = "created_in"
        case email, firstname, lastname
        case storeID = "store_id"
        case websiteID = "website_id"
        case addresses
        case disableAutoGroupChange = "disable_auto_group_change"
        case extensionAttributes = "extension_attributes"
    }
}

struct CustomerExtensionAttributes: Codable {
    let isSubscribed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isSubscribed = "is_subscribed"
    }
}

struct WelcomeExtensionAttributes: Codable {
    let shippingAssignments: [JSONAny]?
    
    enum CodingKeys: String, CodingKey {
        case shippingAssignments = "shipping_assignments"
    }
}

