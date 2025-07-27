//
//  Income.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import Foundation
import GRDB

struct Income: Codable, Hashable, Identifiable, FetchableRecord, PersistableRecord {
    var id: UUID = .init()
    var userID: UUID
    var date: Date
    var source: String
    var grossAmount: Double
    var grossTaxableAmount: Double
    var netAmount: Double
    var lastUpdated: Date
}

#if DEBUG
extension Income {
    private static let dates = [
        Date(timeIntervalSince1970: 1000),
        Date(timeIntervalSince1970: -10),
        Date(timeIntervalSince1970: 934),
        Date(timeIntervalSince1970: -396),
        Date(timeIntervalSince1970: 459222),
        Date(timeIntervalSince1970: -2495),
    ]
    
    private static let uuids = [
        UUID(uuidString: "1234"),
        UUID(uuidString: "5678"),
        UUID(uuidString: "9012"),
        UUID(uuidString: "3456"),
        UUID(uuidString: "7890"),
    ]
    
    private static let sources = [
        "Applebees",
        "Barnes & Nobles",
        "Costco",
        "Dunkin Donuts",
        "Enterprise",
        "Friendly's",
        "Giant",
        "Home Depot",
        "Kroger",
        "Lowe's",
        "McDonald's",
        "Macy's",
        "Target",
        "Walmart"
    ]
    
    
    /// Creates a new Income with random name and random score
    static func makeRandom() -> Income {
        Income(
            userID: getRandomUserID(),
            date: getRandomDate(),
            source: getRandomSource(),
            grossAmount: getRandomAmount(),
            grossTaxableAmount: getRandomAmount(),
            netAmount: getRandomAmount(),
            lastUpdated: getRandomDate()
        )
    }
    
    static func getRandomUserID() -> UUID {
        return (uuids.randomElement()!)!
    }
    
    static func getRandomDate() -> Date {
        return dates.randomElement()!
    }
    
    static func getRandomSource() -> String {
        return sources.randomElement()!
    }
    
    static func getRandomAmount() -> Double {
        return 10 * Double.random(in: 0...1000)
    }
}
#endif
