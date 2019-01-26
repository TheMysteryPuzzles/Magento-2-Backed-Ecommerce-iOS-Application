//
//  CustomerDetails.swift
//  MagentoAPI
//
//  Created by Work on 1/21/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

struct CustomerDetails: Codable {
    let id, groupID: Int
    let createdAt, updatedAt, createdIn, email: String
    let firstname, lastname: String
    let storeID, websiteID: Int
    let addresses: [JSONAny]
    let disableAutoGroupChange: Int
    let extensionAttributes: ExtensionAttributes
    
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

class ExtensionAttributes: Codable {
    let websiteIDS: [Int]?
    let categoryLinks: [CategoryLink]?
    let configurableProductOptions: [ConfigurableProductOption]?
    let configurableProductLinks: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case websiteIDS = "website_ids"
        case categoryLinks = "category_links"
        case configurableProductOptions = "configurable_product_options"
        case configurableProductLinks = "configurable_product_links"
    }
    
    init(websiteIDS: [Int]?, categoryLinks: [CategoryLink]?, configurableProductOptions: [ConfigurableProductOption]?, configurableProductLinks: [Int]?) {
        self.websiteIDS = websiteIDS
        self.categoryLinks = categoryLinks
        self.configurableProductOptions = configurableProductOptions
        self.configurableProductLinks = configurableProductLinks
    }
}
