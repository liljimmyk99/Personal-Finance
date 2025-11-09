//
//  Categories.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import Foundation

struct Category: Codable {
    var id: UUID = .init()
    var name: String
    var description: String?
    var lastUpdated: Date?
    var created: Date?
}

enum CategoryType: String, CaseIterable, Hashable, Codable {
    case savings = "Savings"
    case housing = "Housing"
    case utilities = "Utilities"
    case food = "Food"
    case transportation = "Transportation"
    case entertainment = "Entertainment"
    case debt = "Debt"
    case other = "Other"

    #if DEBUG
        static let allCases: [CategoryType] = [.savings, .housing, .utilities, .food, .transportation, .entertainment, .debt, .other]
    #endif
}
