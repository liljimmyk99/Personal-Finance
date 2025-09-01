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
            HStack {
                Button {
                    selectedMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedMonth) ?? selectedMonth
                } label: {
                    Image(systemName: "chevron.left")
                }
                Text(selectedMonth.formatted(.dateTime.month(.wide).year()))
                Button {
                    selectedMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedMonth) ?? selectedMonth
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    @Previewable @State var selectedMonth: Date = Date()
    
    CalendarHeader(
        selectedMonth: $selectedMonth,
        numTransactions: .constant(0),
        totalSpent: .constant(0.0)
    )
}
