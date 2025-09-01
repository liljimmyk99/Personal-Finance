//
//  MonthsViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/27/25.
//

import Foundation

class MonthsViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var numTransactions: Int = 0
    @Published var totalSpent: Double = 0.0
    private var customerID: Int64
    private var database: AppDatabase = .shared
    
    init ( customerID: Int64?) {
        self.customerID = customerID ?? Int64()
        
        updateTransactions(Date())
    }
    
    private func fetchAllTransactionsByMonth(month: Int, year: Int) -> [Transaction] {
        do {
            return try database.getAllTranactionsForUserAndInterval(
                userID: customerID,
                month: month,
                year: year
            )
        } catch {
            print("Failed to fetch transactions: \(error)")
           return []
        }
    }
    
    func deleteTransaction(transaction: Transaction?) {
        guard let id = transaction?.id else {
            print("Transaction has no ID: \(String(describing: transaction))")
            return
        }
        do {
            try database.deleteTransaction(id: id)
        } catch {
            print("Failed to delete transaction: \(error)")
        }
    }
    
    func getTransaction(id: Int64) -> Transaction? {
        return transactions.first(where: {$0.id == id})
    }
    
    func getMonthAndYear(date: Date) -> (month: Int, year: Int) {
            let month = Calendar.current.component(.month, from: date)
           let year = Calendar.current.component(.year, from: date)
        
        return (month, year)
    }
    
    func updateTransactions(_ date: Date) {
        let (month, year) = getMonthAndYear(date: date)
        self.transactions = fetchAllTransactionsByMonth(month: month, year: year)
        updateHeader()
    }
    
    private func updateHeader() {
        self.numTransactions = transactions.count
        self.totalSpent = transactions.reduce(0) { $0 + $1.amount }
    }
}
