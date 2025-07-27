//
//  IncomeReads.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/20/25.
//

// MARK: - Database Access: Transaction Reads
import GRDB
import Foundation

extension AppDatabase {
    func getIncome(id: UUID) throws -> Income {
        try reader.read { db in
            try Income.fetchOne(db, key: id)!
        }
    }
    
    func getAllIncomeForUser(userID: UUID) throws -> [Income] {
        try reader.read { db in
            try Income
                .filter(Column("userID") == userID)
                .fetchAll(db)
        }
    }
    
    func getAllIncomeForUserAndInterval(userID: UUID, month: Int, year: Int) throws -> [Income] {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1

        guard let startDate = calendar.date(from: components),
              let endDate = calendar.date(byAdding: .month, value: 1, to: startDate) else {
            return []
        }
        
        return try reader.read { db in
            try Income
                .filter(
                    Column("userID") == userID &&
                    Column("date") >= startDate &&
                    Column("date") < endDate
                )
                .fetchAll(db)
        }
    }
    
    func getAllIncomesForUserAndDate(userID: UUID, date: Date) throws -> [Income] {
        try reader.read { db in
            try Income
                .filter(
                    Column("userID") == userID &&
                    Column("date") == date
                )
                .fetchAll(db)
        }
    }
}
