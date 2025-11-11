//
//  User.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/13/25.
//
import Foundation
import GRDB

class User: Codable, Identifiable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    var id: Int64?
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var passwordHash: String

    init(
        id: Int64?,
        firstName: String,
        lastName: String,
        email: String,
        phoneNumber: String,
        passwordHash: String
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.passwordHash = passwordHash
    }
}

// MARK: - Database

extension User: FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    enum Columns {
        static let id = Column(CodingKeys.id)
        static let firstName = Column(CodingKeys.firstName)
        static let lastName = Column(CodingKeys.lastName)
        static let email = Column(CodingKeys.email)
        static let phoneNumber = Column(CodingKeys.phoneNumber)
        static let passwordHash = Column(CodingKeys.passwordHash)
    }

    /// Updates a User id after it has been inserted in the database.
    func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}
