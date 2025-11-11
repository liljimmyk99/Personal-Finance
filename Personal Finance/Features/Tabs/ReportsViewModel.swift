//
//  ReportsViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/26/25.
//
import Foundation

class ReportsViewModel: ObservableObject {
    private var database: AppDatabase
    private var customerID: UUID

    init(dataBase: AppDatabase, customerID: UUID?) {
        database = dataBase
        self.customerID = customerID ?? UUID()
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
