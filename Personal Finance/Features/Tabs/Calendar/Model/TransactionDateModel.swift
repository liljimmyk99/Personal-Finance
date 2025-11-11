//
//  CalendarModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 9/1/25.
//
import Foundation

class TransactionDateModel {
    let date: Date
    let transactions: [Transaction]
    let dateNumber: Int
    let numTransactions: Int
    let totalSpent: Int

    init(date: Date, dateNumber: Int, transactions: [Transaction]) {
        self.date = date
        self.transactions = transactions
        self.dateNumber = dateNumber
        numTransactions = transactions.count
        totalSpent = Int(transactions.reduce(0) { $0 + $1.amount })
    }
}
