//
//  TransactionReads.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/20/25.
//

// MARK: - Database Access: Transaction Reads

import Foundation
import GRDB

extension AppDatabase {
    func getTransaction(id: Int64) throws -> Transaction {
        try reader.read { db in
            try Transaction.fetchOne(db, key: id)!
        }
    }

    func getAllTranactionsForUser(userID: Int64) throws -> [Transaction] {
        try reader.read { db in
            try Transaction
                .filter(Column("userID") == userID)
                .fetchAll(db)
                .sorted(by: {
                    $0.date > $1.date
                })
        }
    }

    func getAllTranactionsForUserAndInterval(userID: Int64, month: Int, year: Int) throws -> [Transaction] {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1

        guard let startDate = calendar.date(from: components),
              let endDate = calendar.date(byAdding: .month, value: 1, to: startDate)
        else {
            return []
        }

        return try reader.read { db in
            try Transaction
                .filter(
                    Column("userID") == userID &&
                        Column("date") >= startDate &&
                        Column("date") < endDate
                )
                .fetchAll(db)
        }
    }

    func getAllTranactionsForUserAndCategory(userID: Int64, category: CategoryType) throws -> [Transaction] {
        try reader.read { db in
            try Transaction
                .filter(
                    Column("userID") == userID &&
                        Column("category") == category.rawValue
                )
                .fetchAll(db)
        }
    }

    func getAllTranactionsForUserAndStore(userID: Int64, store: String) throws -> [Transaction] {
        try reader.read { db in
            try Transaction
                .filter(
                    Column("userID") == userID &&
                        Column("store") == store
                )
                .fetchAll(db)
        }
    }

    func getAllTranactionsForUserAndDate(userID: Int64, date: Date) throws -> [Transaction] {
        try reader.read { db in
            try Transaction
                .filter(
                    Column("userID") == userID &&
                        Column("date") == date
                )
                .fetchAll(db)
        }
    }
}
