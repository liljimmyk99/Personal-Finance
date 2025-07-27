//
//  CategoryViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/26/25.
//
import Foundation
import os.log

class CategoryViewModel: ObservableObject {
    private var customerID: Int64
    private var database: AppDatabase = .shared
    
    init ( customerID: Int64?) {
        self.customerID = customerID ?? Int64()
    }
    
    
    func fetchTransactionsForCategory(category: CategoryType) -> [Transaction] {
        do {
            return try database.getAllTranactionsForUserAndCategory(
                userID: customerID,
                category: category
            )
        } catch {
            print("Failed to fetch transactions: \(error)")
           return []
        }
    }
}
