//
//  IncomeWrites.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/20/25.
//

import GRDB

// MARK: - Database Access: Income Writes

extension AppDatabase {
    /// Saves (inserts or updates) an ``Income``. When the method returns, the
    /// Income is present in the database, and its id is not nil.
    func saveIncome(_ income: inout Income) throws {
        try dbWriter.write { db in
            try income.save(db)
        }
    }

    /// Delete the specified Incomes
    func deleteIncomes(ids: [Int64]) throws {
        try dbWriter.write { db in
            _ = try Income.deleteAll(db, keys: ids)
        }
    }

    /// Delete all Incomes
    func deleteAllIncomes() throws {
        try dbWriter.write { db in
            _ = try Income.deleteAll(db)
        }
    }

    /// Refresh all Incomes (by performing some random changes, for demo purpose).
    func refreshIncomes() async throws {
        try await dbWriter.write { db in
            if try Income.all().isEmpty(db) {
                // When database is empty, insert new random Incomes
                try createRandomIncomes(db)
            } else {
                // Insert a Income
                if Bool.random() {
                    _ = try Income.makeRandom().inserted(db) // insert but ignore inserted id
                }

                // Delete a random Income
                if Bool.random() {
                    try Income.order(sql: "RANDOM()").limit(1).deleteAll(db)
                }

                // Update some Income
                for var income in try Income.fetchAll(db) where Bool.random() {
                    try income.updateChanges(db) {
                        $0.grossAmount = Income.getRandomAmount()
                    }
                }
            }
        }
    }

    /// Create random Incomes if the database is empty.
    func createRandomIncomesIfEmpty() throws {
        try dbWriter.write { db in
            if try Income.all().isEmpty(db) {
                try createRandomIncomes(db)
            }
        }
    }

    /// Support for ``createRandomIncomesIfEmpty()`` and  ``refreshIncomes()``
    private func createRandomIncomes(_ db: Database) throws {
        for _ in 0 ..< 8 {
            _ = try Income.makeRandom().inserted(db) // insert but ignore inserted id
        }
    }
}
