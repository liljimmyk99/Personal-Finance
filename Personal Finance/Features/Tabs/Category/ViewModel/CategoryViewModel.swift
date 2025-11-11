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
    private var transactionsMap: [CategoryType: [Transaction]] = [:]

    init(customerID: Int64?) {
        self.customerID = customerID ?? Int64()
        fetchAllTransactionsByCategory()
    }

    func fetchAllTransactionsByCategory() {
        do {
            let transactions = try database.getAllTranactionsForUser(
                userID: customerID
            )
            for category in CategoryType.allCases {
                let transactions = try database.getAllTranactionsForUserAndCategory(
                    userID: customerID,
                    category: category
                )
                transactionsMap[category] = transactions
            }
        } catch {
            print("Failed to fetch categories: \(error)")
        }
    }

    func fetchTransactionsForCategory(category: CategoryType) -> [Transaction] {
        return transactionsMap[category] ?? []
    }
}
