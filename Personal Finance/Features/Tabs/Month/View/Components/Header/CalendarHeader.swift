//
//  CalendarHeader.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/3/25.
//
import SwiftUI

struct CalendarHeader: View {
    @Binding var selectedMonth: Date
    @Binding var numTransactions: Int
    @Binding var totalSpent: Double

    var body: some View {
        ZStack {
            HStack {
                TransactionInfo(
                    numTransactions: numTransactions,
                    totalSpent: totalSpent
                )
                .padding(.leading)

                Spacer()
            }
            CalendarMonthSelector(selectedMonth: $selectedMonth)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    @Previewable @State var selectedMonth = Date()

    CalendarHeader(
        selectedMonth: $selectedMonth,
        numTransactions: .constant(0),
        totalSpent: .constant(0.0)
    )
}
