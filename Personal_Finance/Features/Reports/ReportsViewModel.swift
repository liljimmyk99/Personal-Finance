//
//  ReportsViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/26/25.
//
import Foundation

class ReportsViewModel: ObservableObject {
    private var database: AppDatabase
    private var customerID: Int64
    
    init (dataBase: AppDatabase, customerID: Int64?) {
        self.database = dataBase
        self.customerID = customerID ?? Int64()
    }
    
    func getTransactionsForUser() -> [Transaction] {
        do {
            return try database.getAllTranactionsForUser(userID: customerID)
        } catch {
            return []
        }
    }
    
    func getTransactionsForUserByMonth(date: Date) -> [Transaction] {
        do {
            return try database.getAllTranactionsForUserAndDate(
                userID: customerID,
                date: date
            )
        } catch {
            return []
        }
    }
}
