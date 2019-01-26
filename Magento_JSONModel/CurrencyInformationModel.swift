//
//  CurrencyInformationModel.swift
//  MagentoAPI
//
//  Created by Work on 1/22/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import Foundation

class CurrencyInformationModel: Codable {
    let baseCurrencyCode: String?
    let baseCurrencySymbol: JSONNull?
    let defaultDisplayCurrencyCode: String?
    let defaultDisplayCurrencySymbol: JSONNull?
    let availableCurrencyCodes: [String]?
    let exchangeRates: [ExchangeRate]?
    
    enum CodingKeys: String, CodingKey {
        case baseCurrencyCode = "base_currency_code"
        case baseCurrencySymbol = "base_currency_symbol"
        case defaultDisplayCurrencyCode = "default_display_currency_code"
        case defaultDisplayCurrencySymbol = "default_display_currency_symbol"
        case availableCurrencyCodes = "available_currency_codes"
        case exchangeRates = "exchange_rates"
    }
    
    init(baseCurrencyCode: String?, baseCurrencySymbol: JSONNull?, defaultDisplayCurrencyCode: String?, defaultDisplayCurrencySymbol: JSONNull?, availableCurrencyCodes: [String]?, exchangeRates: [ExchangeRate]?) {
        self.baseCurrencyCode = baseCurrencyCode
        self.baseCurrencySymbol = baseCurrencySymbol
        self.defaultDisplayCurrencyCode = defaultDisplayCurrencyCode
        self.defaultDisplayCurrencySymbol = defaultDisplayCurrencySymbol
        self.availableCurrencyCodes = availableCurrencyCodes
        self.exchangeRates = exchangeRates
    }
}

class ExchangeRate: Codable {
    let currencyTo: String?
    let rate: Int?
    
    enum CodingKeys: String, CodingKey {
        case currencyTo = "currency_to"
        case rate
    }
    
    init(currencyTo: String?, rate: Int?) {
        self.currencyTo = currencyTo
        self.rate = rate
    }
}

