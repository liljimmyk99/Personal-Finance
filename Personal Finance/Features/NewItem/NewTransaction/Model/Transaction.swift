//
//  Transaction.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import Foundation
import GRDB

struct Transaction: Codable, Hashable, Identifiable {
    var id: Int64?
    var userID: Int64
    var date: Date
    var store: String
    var amount: Double
    var category: CategoryType
    var description: String?
    var lastUpdated: Date
}

#if DEBUG
extension Transaction {
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
        Int64(5678.90),
    ]
    
    private static let stores = [
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
    
    
    /// Creates a new Transaction with random name and random score
    static func makeRandom() -> Transaction {
        Transaction(
            userID: getRandomUserID(),
            date: getRandomDate(),
            store: getRandomStore(),
            amount: getRandomAmount(),
            category: getRandomCateogry(),
            lastUpdated: Date()
        )
    }
    
    static func getRandomUserID() -> Int64 {
        return (ids.randomElement()!)
    }
    
    static func getRandomDate() -> Date {
        return dates.randomElement()!
    }
    
    static func getRandomStore() -> String {
        return stores.randomElement()!
    }
    
    static func getRandomAmount() -> Double {
        return 10 * Double.random(in: 0...1000)
    }
    
    static func getRandomCateogry() -> CategoryType {
        return CategoryType.allCases.randomElement()!
    }
}
#endif

// MARK: - Database
extension Transaction: FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let userID = Column(CodingKeys.userID)
        static let date = Column(CodingKeys.date)
        static let store = Column(CodingKeys.store)
        static let amount = Column(CodingKeys.amount)
        static let category = Column(CodingKeys.category)
        static let description = Column(CodingKeys.description)
    }
    
    /// Updates a Transaction id after it has been inserted in the database.
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}
