//
//  NewIncomeViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/27/25.
//
import Combine
import Foundation

class NewIncomeViewModel: ObservableObject {
    @Published var date: Date = .init()
    @Published var source: String = ""
    @Published var grossAmount: Double = 0.0
    @Published var grossTaxableAmount: Double = 0.0
    @Published var netAmount: Double = 0.0
    private var customerID: Int64
    private var database: AppDatabase = .shared

    init(customerID: Int64?) {
        self.customerID = customerID ?? Int64()
    }

    func createIncome() throws -> Income {
        var income = Income(
            id: Int64(),
            userID: customerID,
            date: date,
            source: source,
            grossAmount: grossAmount,
            grossTaxableAmount: grossTaxableAmount,
            netAmount: netAmount,
            lastUpdated: Date()
        )

        try database.saveIncome(&income)
        return income
    }
}
