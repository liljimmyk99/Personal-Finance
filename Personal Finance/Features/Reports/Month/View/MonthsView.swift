//
//  MonthsView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import AppKit
import SwiftUI

struct MonthsView: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: MonthsViewModel
    @State private var sortOrder: [KeyPathComparator<Transaction>] = [
        .init(\.date, order: .reverse),
    ]
    @State private var selectedMonth: Date = Date()

    var body: some View {
        VStack {
            CalendarHeader(selectedMonth: $selectedMonth)
            
            TransactionList(
                transactions: viewModel.transactions,
                onEditButtonTap: { transaction in
                    openWindow(value: transaction)
                },
                onDeleteButtonTap: { transaction in
                    // TODO: Implement are you Sure
                    viewModel.deleteTransaction(transaction: transaction)
                    viewModel.updateTransactions(selectedMonth)
                }
            )
            
        }
        .onChange(of: appState.isMainWindowInFocus, {_ , newValue in
            if newValue {
                viewModel.updateTransactions(selectedMonth)
            }
        })
        .onChange(of: selectedMonth) {
            viewModel.updateTransactions(selectedMonth)
        }
        .background(PFColors.surface)
    }
}

#Preview {
    MonthsView(viewModel: MonthsViewModel(customerID: Int64()))
}
