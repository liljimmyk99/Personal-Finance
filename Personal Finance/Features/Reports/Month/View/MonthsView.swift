//
//  MonthsView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import AppKit
import SwiftUI

struct MonthsView: View {
    @State private var isFocused: Bool = false
    @Environment(\.openWindow) private var openWindow
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
        .onReceive(
            NotificationCenter.default.publisher(
                for: NSWindow.didBecomeKeyNotification
            )
        ) { _ in
            isFocused = NSApp.keyWindow == NSApp.mainWindow
        }
        .onReceive(
            NotificationCenter.default.publisher(
                for: NSWindow.didResignKeyNotification
            )
        ) { _ in
            isFocused = false
        }
        .onChange(of: selectedMonth) {
            viewModel.updateTransactions(selectedMonth)
        }
        .background(PFColors.surface)
    }
}

#Preview {
    MonthsView(viewModel: MonthsViewModel(customerID: Int64()))
}
