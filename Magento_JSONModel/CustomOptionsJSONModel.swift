//
//  CustomOptionsJSONModel.swift
//  MagentoAPI
//
//  Created by Work on 2/20/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
// To parse the JSON, add this file to your project and do:
//
//   let customOptionsModel = try? newJSONDecoder().decode(CustomOptionsModel.self, from: jsonData)

import Foundation

struct CustomOptionSkuCustomOptionsModel: Codable {
    let id: Int?
    let sku: CustomOptionSkuSku?
    let name: String?
    let attributeSetID, price, status, visibility: Int?
    let typeID, createdAt, updatedAt: String?
    let extensionAttributes: CustomOptionSkuExtensionAttributes?
    let productLinks: [JSONAny]?
    let options: [CustomOptionSkuOption]?
    let mediaGalleryEntries: [CustomOptionSkuMediaGalleryEntry]?
    let tierPrices: [JSONAny]?
    let customAttributes: [CustomOptionSkuCustomAttribute]?
    
    enum CodingKeys: String, CodingKey {
        case id, sku, name
        case attributeSetID = "attribute_set_id"
        case price, status, visibility
        case typeID = "type_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case extensionAttributes = "extension_attributes"
        case productLinks = "product_links"
        case options
        case mediaGalleryEntries = "media_gallery_entries"
        case tierPrices = "tier_prices"
        case customAttributes = "custom_attributes"
    }
}

struct CustomOptionSkuCustomAttribute: Codable {
    let attributeCode: String?
    let value: CustomOptionSkuCustomAttributeValue?
    
    enum CodingKeys: String, CodingKey {
        case attributeCode = "attribute_code"
        case value
    }
}

enum CustomOptionSkuCustomAttributeValue: Codable {
    case string(String)
    case unionArray([CustomOptionSkuValueValue])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([CustomOptionSkuValueValue].self) {
            self = .unionArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(CustomOptionSkuCustomAttributeValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CustomOptionSkuCustomAttributeValue"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .unionArray(let x):
            try container.encode(x)
        }
    }
}

enum CustomOptionSkuValueValue: Codable {
    case bool(Bool)
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(CustomOptionSkuValueValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CustomOptionSkuValueValue"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

struct CustomOptionSkuExtensionAttributes: Codable {
    let websiteIDS: [Int]?
    let categoryLinks: [CustomOptionSkuCategoryLink]?
    let stockItem: CustomOptionSkuStockItem?
    
    enum CodingKeys: String, CodingKey {
        case websiteIDS = "website_ids"
        case categoryLinks = "category_links"
        case stockItem = "stock_item"
    }
}

struct CustomOptionSkuCategoryLink: Codable {
    let position: Int?
    let categoryID: String?
    
    enum CodingKeys: String, CodingKey {
        case position
        case categoryID = "category_id"
    }
}

struct CustomOptionSkuStockItem: Codable {
    let itemID, productID, stockID, qty: Int?
    let isInStock, isQtyDecimal, showDefaultNotificationMessage, useConfigMinQty: Bool?
    let minQty, useConfigMinSaleQty, minSaleQty: Int?
    let useConfigMaxSaleQty: Bool?
    let maxSaleQty: Int?
    let useConfigBackorders: Bool?
    let backorders: Int?
    let useConfigNotifyStockQty: Bool?
    let notifyStockQty: Int?
    let useConfigQtyIncrements: Bool?
    let qtyIncrements: Int?
    let useConfigEnableQtyInc, enableQtyIncrements, useConfigManageStock, manageStock: Bool?
    let lowStockDate: JSONNull?
    let isDecimalDivided: Bool?
    let stockStatusChangedAuto: Int?
    
    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case productID = "product_id"
        case stockID = "stock_id"
        case qty
        case isInStock = "is_in_stock"
        case isQtyDecimal = "is_qty_decimal"
        case showDefaultNotificationMessage = "show_default_notification_message"
        case useConfigMinQty = "use_config_min_qty"
        case minQty = "min_qty"
        case useConfigMinSaleQty = "use_config_min_sale_qty"
        case minSaleQty = "min_sale_qty"
        case useConfigMaxSaleQty = "use_config_max_sale_qty"
        case maxSaleQty = "max_sale_qty"
        case useConfigBackorders = "use_config_backorders"
        case backorders
        case useConfigNotifyStockQty = "use_config_notify_stock_qty"
        case notifyStockQty = "notify_stock_qty"
        case useConfigQtyIncrements = "use_config_qty_increments"
        case qtyIncrements = "qty_increments"
        case useConfigEnableQtyInc = "use_config_enable_qty_inc"
        case enableQtyIncrements = "enable_qty_increments"
        case useConfigManageStock = "use_config_manage_stock"
        case manageStock = "manage_stock"
        case lowStockDate = "low_stock_date"
        case isDecimalDivided = "is_decimal_divided"
        case stockStatusChangedAuto = "stock_status_changed_auto"
    }
}

struct CustomOptionSkuMediaGalleryEntry: Codable {
    let id: Int?
    let mediaType: String?
    let label: JSONNull?
    let position: Int?
    let disabled: Bool?
    let types: [String]?
    let file: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaType = "media_type"
        case label, position, disabled, types, file
    }
}

struct CustomOptionSkuOption: Codable {
    let productSku: CustomOptionSkuSku?
    let optionID: Int?
    let title: String?
    let type: CustomOptionSkuType?
    let sortOrder: Int?
    let isRequire: Bool?
    let values: [CustomOptionSkuValueClass]?
    let price: Int?
    let priceType: CustomOptionSkuPriceType?
    let maxCharacters: Int?
    
    enum CodingKeys: String, CodingKey {
        case productSku = "product_sku"
        case optionID = "option_id"
        case title, type
        case sortOrder = "sort_order"
        case isRequire = "is_require"
        case values, price
        case priceType = "price_type"
        case maxCharacters = "max_characters"
    }
}

enum CustomOptionSkuPriceType: String, Codable {
    case fixed = "fixed"
    case percent = "percent"
}

enum CustomOptionSkuSku: String, Codable {
    case wc120013 = "WC-12-0013"
}

enum CustomOptionSkuType: String, Codable {
    case area = "area"
    case dropDown = "drop_down"
    case radio = "radio"
}

struct CustomOptionSkuValueClass: Codable {
    let title: String?
    let sortOrder: Int?
    let price: Double?
    let priceType: CustomOptionSkuPriceType?
    let sku: String?
    let optionTypeID: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case sortOrder = "sort_order"
        case price
        case priceType = "price_type"
        case sku
        case optionTypeID = "option_type_id"
    }
}
