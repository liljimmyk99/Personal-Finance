//
//  User.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/13/25.
//
import Foundation
import SwiftData

@Model
class User: ObservableObject {
    @Attribute(.unique) var id: UUID
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var passwordHash: String
    
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
