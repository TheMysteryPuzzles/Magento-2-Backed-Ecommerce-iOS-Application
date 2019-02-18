//
//  ShowroomJSONModel.swift
//  MagentoAPI
//
//  Created by Work on 2/15/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

struct ShowroomJSONModel: Codable {
    let response: ShowroomResponse?
}

struct ShowroomResponse: Codable {
    let msg: String?
    let code: Int?
    let data: ShowroomDataClass?
}

struct ShowroomDataClass: Codable {
    let storelocations: [[String: String?]]?
}
