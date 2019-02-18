//
//  SloganJSONModel.swift
//  MagentoAPI
//
//  Created by Work on 2/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

struct SloganJSONModel: Codable {
    let response: Response?
}

struct Response: Codable {
    let msg: String?
    let code: Int?
    let data: DataClass?
}

struct DataClass: Codable {
    let storelocations: [Storelocation]?
}

struct Storelocation: Codable {
    let id, slogan: String?
}

