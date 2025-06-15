//
//  MonthsView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import SwiftUI

struct MonthsView: View {
    @State var transactions: [Transaction] = []
    @State private var filteredTransactions: [Transaction] = []
    @State private var sortOrder: [KeyPathComparator<Transaction>] = [
        .init(\.date, order: .reverse),
    ]
    @State private var selectedMonth: Date = Date()

    var body: some View {
        VStack {
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
            .padding(.vertical, 8)
            
            Table(
                filteredTransactions.sorted(using: sortOrder),
                sortOrder: $sortOrder
            ) {
                TableColumn("Store", value: \.store)
                TableColumn("Date") { transaction in
                    Text(transaction.date.formatted(.dateTime.month().day()))
                }
                TableColumn("Amount") { transaction in
                    Text(transaction.amount, format: .currency(code: "USD"))
                }
                TableColumn("Category", value: \.category)
            }
        }
        .onChange(of: selectedMonth) {
            filteredTransactions =  transactions.filter({
                $0.date.formatted(.dateTime.month().year()) == selectedMonth.formatted(.dateTime.month().year())
            })
        }
        .onAppear() {
            filteredTransactions = transactions.filter({
                $0.date.formatted(.dateTime.month().year()) == selectedMonth.formatted(.dateTime.month().year())
            })
        }
    }
}

#Preview {
    MonthsView(transactions: Transaction.demoData)
}
