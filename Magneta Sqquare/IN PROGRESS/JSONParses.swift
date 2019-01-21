//
//  JSONParses.swift
//  MagentoAPI
//
//  Created by Work on 1/19/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct Categories: Codable {
    let id, parentID: Int
    let name: String
    let isActive: Bool
    let position, level, productCount: Int
    let childrenData: [Categories]
    
    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parent_id"
        case name
        case isActive = "is_active"
        case position, level
        case productCount = "product_count"
        case childrenData = "children_data"
    }
}

// MARK: Convenience initializers and mutators

extension Categories {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Categories.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int? = nil,
        parentID: Int? = nil,
        name: String? = nil,
        isActive: Bool? = nil,
        position: Int? = nil,
        level: Int? = nil,
        productCount: Int? = nil,
        childrenData: [Categories]? = nil
        ) -> Categories {
        return Categories(
            id: id ?? self.id,
            parentID: parentID ?? self.parentID,
            name: name ?? self.name,
            isActive: isActive ?? self.isActive,
            position: position ?? self.position,
            level: level ?? self.level,
            productCount: productCount ?? self.productCount,
            childrenData: childrenData ?? self.childrenData
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
