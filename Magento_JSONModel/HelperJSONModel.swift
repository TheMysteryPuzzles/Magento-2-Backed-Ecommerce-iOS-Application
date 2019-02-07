//
//  ProductDetailsModel.swift
//  MagentoAPI
//
//  Created by Work on 1/22/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

class CategoryLink: Codable {
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

class ConfigurableProductOption: Codable {
    let id: Int?
    let attributeID: String?
    let label: Label?
    let position: Int?
    let values: [ValueElement1]?
    let productID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case attributeID = "attribute_id"
        case label, position, values
        case productID = "product_id"
    }
    
    init(id: Int?, attributeID: String?, label: Label?, position: Int?, values: [ValueElement1]?, productID: Int?) {
        self.id = id
        self.attributeID = attributeID
        self.label = label
        self.position = position
        self.values = values
        self.productID = productID
    }
}

enum Label: String, Codable {
    case color = "Color"
    case operations = "Operations"
}

class ConfigurableProductOptionValue: Codable {
    let valueIndex: Int?
    
    enum CodingKeys: String, CodingKey {
        case valueIndex = "value_index"
    }
    
    init(valueIndex: Int?) {
        self.valueIndex = valueIndex
    }
}



class Option: Codable {
    let productSku: String?
    let optionID: Int?
    let title: Title?
    let type: TypeEnum?
    let sortOrder: Int?
    let isRequire: Bool?
    let price: Int?
    let priceType: PriceType?
    let maxCharacters, imageSizeX, imageSizeY: Int?
    let values: [OptionValue]?
    
    enum CodingKeys: String, CodingKey {
        case productSku = "product_sku"
        case optionID = "option_id"
        case title, type
        case sortOrder = "sort_order"
        case isRequire = "is_require"
        case price
        case priceType = "price_type"
        case maxCharacters = "max_characters"
        case imageSizeX = "image_size_x"
        case imageSizeY = "image_size_y"
        case values
    }
    
    init(productSku: String?, optionID: Int?, title: Title?, type: TypeEnum?, sortOrder: Int?, isRequire: Bool?, price: Int?, priceType: PriceType?, maxCharacters: Int?, imageSizeX: Int?, imageSizeY: Int?, values: [OptionValue]?) {
        self.productSku = productSku
        self.optionID = optionID
        self.title = title
        self.type = type
        self.sortOrder = sortOrder
        self.isRequire = isRequire
        self.price = price
        self.priceType = priceType
        self.maxCharacters = maxCharacters
        self.imageSizeX = imageSizeX
        self.imageSizeY = imageSizeY
        self.values = values
    }
}

enum PriceType: String, Codable {
    case fixed = "fixed"
}

enum Title: String, Codable {
    case cordOperation = "Cord Operation"
    case heightInch = "Height (Inch)"
    case mountDetail = "Mount Detail"
    case widthInch = "Width (Inch)"
}

enum TypeEnum: String, Codable {
    case field = "field"
    case multiple = "multiple"
    case radio = "radio"
}

class OptionValue: Codable {
    let title: String?
    let sortOrder, price: Int?
    let priceType: PriceType?
    let optionTypeID: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case sortOrder = "sort_order"
        case price
        case priceType = "price_type"
        case optionTypeID = "option_type_id"
    }
    
    init(title: String?, sortOrder: Int?, price: Int?, priceType: PriceType?, optionTypeID: Int?) {
        self.title = title
        self.sortOrder = sortOrder
        self.price = price
        self.priceType = priceType
        self.optionTypeID = optionTypeID
    }
}

enum TypeID: String, Codable {
    case configurable = "configurable"
    case virtual = "virtual"
}



class FilterGroup: Codable {
    let filters: [Filter]?
    
    init(filters: [Filter]?) {
        self.filters = filters
    }
}

class Filter: Codable {
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

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

