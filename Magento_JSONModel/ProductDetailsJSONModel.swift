//
//  WirelessSecurityModel.swift
//  MagentoAPI
//
//  Created by Work on 2/7/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

class ProductDetailsJSONModel: Codable {
    let items: [Item]?
    let searchCriteria: SearchCriteria?
    let totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case items
        case searchCriteria = "search_criteria"
        case totalCount = "total_count"
    }
    
    init(items: [Item]?, searchCriteria: SearchCriteria?, totalCount: Int?) {
        self.items = items
        self.searchCriteria = searchCriteria
        self.totalCount = totalCount
    }
}

class Item: Codable {
    let id: Int?
    let sku, name: String?
    let attributeSetID, price, status, visibility: Int?
    let typeID, createdAt, updatedAt: String?
    let extensionAttributes: ExtensionAttributes?
    let productLinks, options: [JSONAny]?
    let mediaGalleryEntries: [MediaGalleryEntry]?
    let tierPrices: [JSONAny]?
    let customAttributes: [CustomAttribute]?
    
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
    
    init(id: Int?, sku: String?, name: String?, attributeSetID: Int?, price: Int?, status: Int?, visibility: Int?, typeID: String?, createdAt: String?, updatedAt: String?, extensionAttributes: ExtensionAttributes?, productLinks: [JSONAny]?, options: [JSONAny]?, mediaGalleryEntries: [MediaGalleryEntry]?, tierPrices: [JSONAny]?, customAttributes: [CustomAttribute]?) {
        self.id = id
        self.sku = sku
        self.name = name
        self.attributeSetID = attributeSetID
        self.price = price
        self.status = status
        self.visibility = visibility
        self.typeID = typeID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.extensionAttributes = extensionAttributes
        self.productLinks = productLinks
        self.options = options
        self.mediaGalleryEntries = mediaGalleryEntries
        self.tierPrices = tierPrices
        self.customAttributes = customAttributes
    }
}

class CustomAttribute: Codable {
    let attributeCode: String?
    let value: ValueUnion?
    
    enum CodingKeys: String, CodingKey {
        case attributeCode = "attribute_code"
        case value
    }
    
    init(attributeCode: String?, value: ValueUnion?) {
        self.attributeCode = attributeCode
        self.value = value
    }
}

enum ValueUnion: Codable {
    case string(String)
    case stringArray([String])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ValueUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueUnion"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

class ExtensionAttributes: Codable {
    let websiteIDS: [Int]?
    let categoryLinks: [CategoryLink1]?
    let configurableProductOptions: [ConfigurableProductOption1]?
    let configurableProductLinks: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case websiteIDS = "website_ids"
        case categoryLinks = "category_links"
        case configurableProductOptions = "configurable_product_options"
        case configurableProductLinks = "configurable_product_links"
    }
    
    init(websiteIDS: [Int]?, categoryLinks: [CategoryLink1]?, configurableProductOptions: [ConfigurableProductOption1]?, configurableProductLinks: [Int]?) {
        self.websiteIDS = websiteIDS
        self.categoryLinks = categoryLinks
        self.configurableProductOptions = configurableProductOptions
        self.configurableProductLinks = configurableProductLinks
    }
}

class CategoryLink1: Codable {
    let position: Int?
    let categoryID: String?
    
    enum CodingKeys: String, CodingKey {
        case position
        case categoryID = "category_id"
    }
    
    init(position: Int?, categoryID: String?) {
        self.position = position
        self.categoryID = categoryID
    }
}

class ConfigurableProductOption1: Codable {
    let id: Int?
    let attributeID, label: String?
    let position: Int?
    let values: [ValueElement1]?
    let productID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case attributeID = "attribute_id"
        case label, position, values
        case productID = "product_id"
    }
    
    init(id: Int?, attributeID: String?, label: String?, position: Int?, values: [ValueElement1]?, productID: Int?) {
        self.id = id
        self.attributeID = attributeID
        self.label = label
        self.position = position
        self.values = values
        self.productID = productID
    }
}

class ValueElement1: Codable {
    let valueIndex: Int?
    
    enum CodingKeys: String, CodingKey {
        case valueIndex = "value_index"
    }
    
    init(valueIndex: Int?) {
        self.valueIndex = valueIndex
    }
}

class MediaGalleryEntry: Codable {
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
    
    init(id: Int?, mediaType: String?, label: JSONNull?, position: Int?, disabled: Bool?, types: [String]?, file: String?) {
        self.id = id
        self.mediaType = mediaType
        self.label = label
        self.position = position
        self.disabled = disabled
        self.types = types
        self.file = file
    }
}

class SearchCriteria: Codable {
    let filterGroups: [FilterGroup1]?
    
    enum CodingKeys: String, CodingKey {
        case filterGroups = "filter_groups"
    }
    
    init(filterGroups: [FilterGroup1]?) {
        self.filterGroups = filterGroups
    }
}

class FilterGroup1: Codable {
    let filters: [Filter]?
    
    init(filters: [Filter]?) {
        self.filters = filters
    }
}

class Filter1: Codable {
    let field, value, conditionType: String?
    
    enum CodingKeys: String, CodingKey {
        case field, value
        case conditionType = "condition_type"
    }
    
    init(field: String?, value: String?, conditionType: String?) {
        self.field = field
        self.value = value
        self.conditionType = conditionType
    }
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func wirelessSecurityJSONModelTask(with url: URL, completionHandler: @escaping (ProductDetailsJSONModel?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
