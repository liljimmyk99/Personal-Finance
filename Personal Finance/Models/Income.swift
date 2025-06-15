//
//  Income.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import Foundation

struct Income: Codable {
    var id: UUID = .init()
    var date: Date
    var grossAmount: Double
    var grossTaxableAmount: Double
    var netAmount: Double
    var lastUpdated: Date
}
