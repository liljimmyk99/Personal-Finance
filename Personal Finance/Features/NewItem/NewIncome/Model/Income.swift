//
//  Income.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import Foundation
import GRDB

struct Income: Codable, Hashable, Identifiable {
    var id: Int64
    var userID: Int64
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
    
    private static let ids = [
        Int64(1234.56),
        Int64(7890.12),
        Int64(3456.78),
        Int64(9012.34),
        Int64(5678.90)
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
            id: getRandomUserID(),
            userID: getRandomUserID(),
            date: getRandomDate(),
            source: getRandomSource(),
            grossAmount: getRandomAmount(),
            grossTaxableAmount: getRandomAmount(),
            netAmount: getRandomAmount(),
            lastUpdated: getRandomDate()
        )
    }
    
    static func getRandomUserID() -> Int64 {
        return (ids.randomElement())!
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

// MARK: - Database
extension Income: FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    enum Columns {        
        static let id = Column(CodingKeys.id)
        static let userID = Column(CodingKeys.userID)
        static let date = Column(CodingKeys.date)
        static let source = Column(CodingKeys.source)
        static let grossAmount = Column(CodingKeys.grossAmount)
        static let grossTaxableAmount = Column(CodingKeys.grossTaxableAmount)
        static let netAmount = Column(CodingKeys.netAmount)
        static let lastUpdated = Column(CodingKeys.lastUpdated)
    }
    
    /// Updates a Transaction id after it has been inserted in the database.
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}
