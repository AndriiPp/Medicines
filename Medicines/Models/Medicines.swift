//
//  Medicines.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import Foundation

// MARK: - Welcome
struct Medicines: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]
    let code: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let composition: Composition?
    let packaging: Packaging?
    let trade_label: TradeLabel?
    let manufacturer: Manufacturer?

}

// MARK: - Composition
struct Composition: Codable {
    let description: String?
    let inn: TradeLabel?
    let pharm_form: PharmForm?

}

// MARK: - TradeLabel
struct TradeLabel: Codable {
    let name: String?
}


// MARK: - PharmForm
class PharmForm: Codable {
    let name: String?

}

// MARK: - Manufacturer
struct Manufacturer: Codable {
    let name: String?
}


// MARK: - Packaging
struct Packaging: Codable {
    let description: String?

}


