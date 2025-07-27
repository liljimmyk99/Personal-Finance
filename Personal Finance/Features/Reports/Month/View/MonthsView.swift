//
//  MonthsView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import SwiftUI

struct MonthsView: View {
    @ObservedObject var viewModel: MonthsViewModel
    @State private var sortOrder: [KeyPathComparator<Transaction>] = [
        .init(\.date, order: .reverse),
    ]
    @State private var selectedMonth: Date = Date()
    @FocusState var isFocused: Bool

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
                viewModel.transactions.sorted(using: sortOrder),
                sortOrder: $sortOrder
            ) {
                TableColumn("Store", value: \.store)
                TableColumn("Date") { transaction in
                    Text(transaction.date.formatted(.dateTime.month().day()))
                }
                TableColumn("Amount") { transaction in
                    Text(transaction.amount, format: .currency(code: "USD"))
                }
                TableColumn("Category", value: \.category.rawValue)
            }
        }
        .onChange(of: selectedMonth) {
            viewModel.updateTransactions(selectedMonth)
        }
        .focused($isFocused)
        .onChange(of: isFocused, { oldFocus, newFocus in
            if newFocus {
                viewModel.updateTransactions(selectedMonth)
            }
        })
        .background(PFColors.surface)
    }
}

#Preview {
    MonthsView(viewModel: MonthsViewModel(customerID: Int64()))
}
