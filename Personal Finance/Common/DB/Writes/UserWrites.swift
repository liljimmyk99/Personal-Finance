//
//  UserWrites.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/20/25.
//

// MARK: - Database Access: User Writes

extension AppDatabase {
    /// Saves (inserts or updates) a ``User``. When the method returns, the
    /// User is present in the database, and its id is not nil.
    func saveUser(_ user: inout User) throws {
        try dbWriter.write { db in
            try user.save(db)
        }
    }
    
    /// Delete the specified Users
    func deleteUsers(ids: [Int64]) throws {
        try dbWriter.write { db in
            _ = try User.deleteAll(db, keys: ids)
        }
    }
    
    /// Delete all Users
    func deleteAllUsers() throws {
        try dbWriter.write { db in
            _ = try User.deleteAll(db)
        }
    }
}
