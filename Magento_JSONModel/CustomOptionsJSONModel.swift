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

struct CustomOptionsModel: Codable {
    let id: Int?
    let sku: Sku?
    let name: String?
    let attributeSetID, price, status, visibility: Int?
    let typeID, createdAt, updatedAt: String?
    let extensionAttributes: ExtensionAttributes1?
    let productLinks: [JSONAny]?
    let options: [Option1]?
    let mediaGalleryEntries: [MediaGalleryEntry]?
    let tierPrices: [JSONAny]?
    let customAttributes: [CustomAttribute1]?
    
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

struct CustomAttribute1: Codable {
    let attributeCode: String?
    let value: CustomAttributeValue?
    
    enum CodingKeys: String, CodingKey {
        case attributeCode = "attribute_code"
        case value
    }
}

enum CustomAttributeValue: Codable {
    case string(String)
    case unionArray([ValueValue])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([ValueValue].self) {
            self = .unionArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(CustomAttributeValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CustomAttributeValue"))
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

enum ValueValue: Codable {
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
        throw DecodingError.typeMismatch(ValueValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueValue"))
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

struct ExtensionAttributes1: Codable {
    let websiteIDS: [Int]?
    let categoryLinks: [CategoryLink2]?
    let stockItem: StockItem?
    
    enum CodingKeys: String, CodingKey {
        case websiteIDS = "website_ids"
        case categoryLinks = "category_links"
        case stockItem = "stock_item"
    }
}

struct CategoryLink2: Codable {
    let position: Int?
    let categoryID: String?
    
    enum CodingKeys: String, CodingKey {
        case position
        case categoryID = "category_id"
    }
}

struct StockItem: Codable {
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


struct Option1: Codable {
    let productSku: Sku?
    let optionID: Int?
    let title: String?
    let type: TypeEnum1?
    let sortOrder: Int?
    let isRequire: Bool?
    let values: [ValueClass]?
    let price: Int?
    let priceType: PriceType1?
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

enum PriceType1: String, Codable {
    case fixed = "fixed"
}

enum Sku: String, Codable {
    case wc120013 = "WC-12-0013"
}

enum TypeEnum1: String, Codable {
    case area = "area"
    case dropDown = "drop_down"
    case radio = "radio"
}

struct ValueClass: Codable {
    let title: String?
    let sortOrder, price: Int?
    let priceType: PriceType1?
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


