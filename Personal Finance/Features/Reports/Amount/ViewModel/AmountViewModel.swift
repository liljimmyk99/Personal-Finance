//
//  AmountViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/27/25.
//
import Foundation

class AmountViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    private var customerID: Int64
    private var database: AppDatabase = .shared
    
    init ( customerID: Int64?) {
        self.customerID = customerID ?? Int64()
        fetchAllTransactions()
    }
    
    func fetchAllTransactions() {
        do {
            transactions = try database.getAllTranactionsForUser(userID: customerID)
        } catch {
            print("Failed to fetch transactions: \(error)")
            transactions = []
        }
    }
}
