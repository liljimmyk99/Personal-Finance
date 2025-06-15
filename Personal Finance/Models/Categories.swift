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
