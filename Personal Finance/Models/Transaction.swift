//
//  Transaction.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import Foundation

struct Transaction: Identifiable {
    var id: UUID = .init()
    var date: Date
    var store: String
    var amount: Double
    var category: String
    var description: String?
    
    static var demoData: [Transaction] = [
        Transaction(date: Date(), store: "Whole Foods", amount: 54.23, category: "Food"),
        Transaction(date: Calendar.current.date(byAdding: .month, value: -1, to: Date())!, store: "Apple Store", amount: 1299.99, category: "Entertainment"),
        Transaction(date: Calendar.current.date(byAdding: .day, value: -23, to: Date())!, store: "Starbucks", amount: 5.75, category: "Dining"),
        Transaction(date: Calendar.current.date(byAdding: .month, value: -3, to: Date())!, store: "Netflix", amount: 15.49, category: "Entertainment"),
        Transaction(date: Calendar.current.date(byAdding: .day, value: -56, to: Date())!, store: "Amazon", amount: 89.67, category: "Entertainment"),
        Transaction(date: Calendar.current.date(byAdding: .day, value: -68, to: Date())!, store: "Trader Joe's", amount: 32.19, category: "Groceries"),
        Transaction(date: Calendar.current.date(byAdding: .day, value: -78, to: Date())!, store: "Chipotle", amount: 12.80, category: "Dining"),
        Transaction(date: Calendar.current.date(byAdding: .day, value: -48, to: Date())!, store: "Spotify", amount: 9.99, category: "Entertainment"),
        Transaction(date: Calendar.current.date(byAdding: .day, value: -34, to: Date())!, store: "Best Buy", amount: 250.00, category: "Electronics"),
        Transaction(date: Calendar.current.date(byAdding: .month, value: -10, to: Date())!, store: "Costco", amount: 210.55, category: "Groceries"),
    ]
}
