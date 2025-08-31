//
//  EditTransactionViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/26/25.
//
import Foundation

class EditTransactionViewModel: ObservableObject {
    @Published var store: String
    @Published var date: Date
    @Published var category: CategoryType
    @Published var amount: String
    private var transactionID: Int64?
    private var customerID: Int64
    private var database: AppDatabase = .shared
    
    init(customerID: Int64?) {
        self.store = ""
        self.date = Date()
        self.category = .other
        self.amount = "0.00"
        self.customerID = customerID ?? Int64()
    }
    
    init(transaction: Transaction?, customerID: Int64?) {
        guard let transaction else {
            self.store = ""
            self.date = Date()
            self.category = .other
            self.amount = "0.00"
            self.transactionID =  Int64()
            self.customerID = Int64()
            
            return
        }
        
        self.store = transaction.store
        self.date = transaction.date
        self.category = transaction.category
        self.amount = String(transaction.amount)
        self.transactionID = transaction.id
        self.customerID = customerID ?? Int64()
    }
    
    func createTransaction() throws -> Transaction {
        let formattedAmount = Double(amount) ?? 0.0
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
