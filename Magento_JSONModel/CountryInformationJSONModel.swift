//
//  CountryInformationModel.swift
//  MagentoAPI
//
//  Created by Work on 1/22/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation


typealias CountryInformationJSONModel = [CountryInformationModelElement]

class CountryInformationModelElement: Codable {
    let id, twoLetterAbbreviation, threeLetterAbbreviation, fullNameLocale: String?
    let fullNameEnglish: String?
    let availableRegions: [AvailableRegion]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case twoLetterAbbreviation = "two_letter_abbreviation"
        case threeLetterAbbreviation = "three_letter_abbreviation"
        case fullNameLocale = "full_name_locale"
        case fullNameEnglish = "full_name_english"
        case availableRegions = "available_regions"
    }
    
    init(id: String?, twoLetterAbbreviation: String?, threeLetterAbbreviation: String?, fullNameLocale: String?, fullNameEnglish: String?, availableRegions: [AvailableRegion]?) {
        self.id = id
        self.twoLetterAbbreviation = twoLetterAbbreviation
        self.threeLetterAbbreviation = threeLetterAbbreviation
        self.fullNameLocale = fullNameLocale
        self.fullNameEnglish = fullNameEnglish
        self.availableRegions = availableRegions
    }
}

class AvailableRegion: Codable {
    let id, code, name: String?
    
    init(id: String?, code: String?, name: String?) {
        self.id = id
        self.code = code
        self.name = name
    }
}
