//
//  UserReads.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/20/25.
//

// MARK: - Database Access: User Reads

import Foundation
import GRDB

extension AppDatabase {
    func getUser(id: Int64) throws -> User {
        try reader.read { db in
            try User.fetchOne(db, key: id)!
        }
    }

    func getUserByEmail(_ email: String) throws -> User {
        try reader.read { db in
            try User
                .filter(Column("email") == email)
                .fetchOne(db)!
        }
    }

    func getAllUsers() throws -> [User] {
        try reader.read { db in
            try User.fetchAll(db)
        }
    }
}
