//
//  EditTransactionViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/26/25.
//
import Combine
import Foundation

class EditTransactionViewModel: ObservableObject {
    @Published var store: String
    @Published var date: Date
    @Published var category: CategoryType
    @Published var amount: String
    @Published var isTransactionValid: Bool = false
    private var transactionID: Int64?
    private var customerID: Int64
    private var database: AppDatabase = .shared

    init(customerID: Int64?) {
        store = ""
        date = Date()
        category = .other
        amount = "0.00"
        self.customerID = customerID ?? Int64()

        Publishers.CombineLatest($store, $amount)
            .map { store, amount in
                if store == "" || amount == "$0.00" {
                    return false
                } else {
                    return true
                }
            }
            .assign(to: &$isTransactionValid)
    }

    init(transaction: Transaction?, customerID: Int64?) {
        guard let transaction else {
            store = ""
            date = Date()
            category = .other
            amount = "0.00"
            transactionID = Int64()
            self.customerID = Int64()

            return
        }

        store = transaction.store
        date = transaction.date
        category = transaction.category
        amount = String(transaction.amount)
        transactionID = transaction.id
        self.customerID = customerID ?? Int64()
        
        Publishers.CombineLatest($store, $amount)
            .map { store, amount in
                if store == "" || amount == "$0.00" {
                    return false
                } else {
                    return true
                }
            }
            .assign(to: &$isTransactionValid)

    }

    func createTransaction() throws -> Transaction {
        var amountCopy = amount
        amountCopy.remove(at: amountCopy.startIndex)
        
        let formattedAmount = Double(amountCopy) ?? 0.0
        var transaction = Transaction(
            id: transactionID,
            userID: customerID,
            date: date,
            store: store,
            amount: formattedAmount,
            category: category,
            lastUpdated: Date()
        )

        try database.saveTransaction(&transaction)
        return transaction
    }
}
