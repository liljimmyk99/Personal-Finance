//
//  TranactionWrites.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/20/25.
//

import GRDB

// MARK: - Database Access: Tranaction Writes

extension AppDatabase {
    /// Saves (inserts or updates) a ``Transaction``. When the method returns, the
    /// transaction is present in the database, and its id is not nil.
    func saveTransaction(_ transaction: inout Transaction) throws {
        try dbWriter.write { db in
            try transaction.save(db)
        }
    }

    /// Delete the specified transaction
    func deleteTransaction(id: Int64) throws {
        try dbWriter.write { db in
            _ = try Transaction.deleteOne(db, key: id)
        }
    }

    /// Delete the specified transactions
    func deleteTransactions(ids: [Int64]) throws {
        try dbWriter.write { db in
            _ = try Transaction.deleteAll(db, keys: ids)
        }
    }

    /// Delete all transactions
    func deleteAllTransactions() throws {
        try dbWriter.write { db in
            _ = try Transaction.deleteAll(db)
        }
    }

    /// Refresh all transactions (by performing some random changes, for demo purpose).
    func refreshTranactions() async throws {
        try await dbWriter.write { db in
            if try Transaction.all().isEmpty(db) {
                // When database is empty, insert new random Transactions
                try createRandomTranactions(db)
            } else {
                // Insert a Transaction
                if Bool.random() {
                    _ = try Transaction.makeRandom().inserted(db) // insert but ignore inserted id
                }

                // Delete a random Transaction
                if Bool.random() {
                    try Transaction.order(sql: "RANDOM()").limit(1).deleteAll(db)
                }

                // Update some Transaction
                for var tranaction in try Transaction.fetchAll(db) where Bool.random() {
                    try tranaction.updateChanges(db) {
                        $0.amount = Transaction.getRandomAmount()
                    }
                }
            }
        }
    }

    /// Create random transactions if the database is empty.
    func createRandomTransactionsIfEmpty() throws {
        try dbWriter.write { db in
            if try Transaction.all().isEmpty(db) {
                try createRandomTranactions(db)
            }
        }
    }

    /// Support for ``createRandomIncomesIfEmpty()`` and ``refreshTranactions()``
    private func createRandomTranactions(_ db: Database) throws {
        for _ in 0 ..< 8 {
            _ = try Transaction.makeRandom().inserted(db) // insert but ignore inserted id
        }
    }
}
