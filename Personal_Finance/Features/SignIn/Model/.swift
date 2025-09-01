//
//  User.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/13/25.
//
import Foundation
import SwiftData

@Model
class UserAccount: ObservableObject {
    @Attribute(.unique) var id: UUID
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var passwordHash: String
    var userID: Int64

    @Relationship(deleteRule: .cascade)
    var income: [Income] = []

    @Relationship(deleteRule: .cascade)
    var transactions: [Transaction] = []

    init(
        id: UUID = UUID(),
        firstName: String,
        lastName: String,
        email: String,
        phoneNumber: String,
        passwordHash: String,
        userID: Int64
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.passwordHash = passwordHash
        self.userID = userID
    }
}
