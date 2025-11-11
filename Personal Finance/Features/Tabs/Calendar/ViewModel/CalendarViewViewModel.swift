//
//  CalendarViewViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 9/1/25.
//

import Foundation

class CalendarViewViewModel: ObservableObject {
    @Published var selectedMonth: Date = .init()
    @Published var numTransactions: Int = 0
    @Published var totalSpent: Double = 0.0
    private var customerID: Int64
    private var database: AppDatabase = .shared

    @Published private var transactions: [Transaction] = []

    init(customerID: Int64?) {
        self.customerID = customerID ?? Int64()
    }

    func getDateNumberByWeek(weekIndex: Int) -> [TransactionDateModel?] {
        let calendar = Calendar.current
        // Get the first day of the month
        let components = calendar.dateComponents([.year, .month], from: selectedMonth)
        guard let firstDayOfMonth = calendar.date(from: components) else { return [] }
        let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth)!
        let daysInMonth = range.count

        // Find the weekday of the first day (Sunday = 1, Saturday = 7)
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)

        // Build an array of all days in the month, offset by the first weekday
        var daysArray: [Int?] = Array(repeating: nil, count: firstWeekday - 1)
        daysArray += Array(1 ... daysInMonth).map { Optional($0) }

        // Pad the end so the array is a multiple of 7
        while daysArray.count % 7 != 0 {
            daysArray.append(nil)
        }

        // Get the week slice
        let start = weekIndex * 7
        let end = start + 7
        if start < daysArray.count {
            if start < daysArray.count {
                return Array(daysArray[start ..< min(end, daysArray.count)]).map { dayNumber in
                    guard let dayNumber else { return nil }
                    var dateComponents = calendar.dateComponents([.year, .month], from: selectedMonth)
                    dateComponents.day = dayNumber
                    guard let date = calendar.date(from: dateComponents) else { return nil }
                    let transactionsForDay = transactions.filter {
                        calendar.isDate($0.date, inSameDayAs: date)
                    }
                    return TransactionDateModel(date: date, dateNumber: dayNumber, transactions: transactionsForDay)
                }
            } else {
                return Array(repeating: nil, count: 7)
            }
        } else {
            return Array(repeating: nil, count: 7)
        }
    }

    func getMonthAndYear(date: Date) -> (month: Int, year: Int) {
        let month = Calendar.current.component(.month, from: date)
        let year = Calendar.current.component(.year, from: date)

        return (month, year)
    }

    func updateTransactions() {
        let transactions = fetchAllTransactionsByMonth(date: selectedMonth)
        let transactionsSortedByDate = transactions.sorted { $0.date > $1.date }
        self.transactions = transactionsSortedByDate
        self.numTransactions = transactions.count
        self.totalSpent = transactions.reduce(0) { $0 + $1.amount }
    }

    private func fetchAllTransactionsByMonth(date: Date) -> [Transaction] {
        let (month, year) = getMonthAndYear(date: date)

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
}
