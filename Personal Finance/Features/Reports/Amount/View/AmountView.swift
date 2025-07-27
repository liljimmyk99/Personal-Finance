//
//  CategoryView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//

import SwiftUI

struct AmountView: View {
    @ObservedObject var viewModel: AmountViewModel
    @State private var sortOrder: [KeyPathComparator<Transaction>] = [
        .init(\.store, order: .forward),
    ]
    @FocusState private var isFocused: Bool

    var body: some View {
        Table(
            viewModel.transactions.sorted(using: sortOrder),
            sortOrder: $sortOrder
        ) {
            TableColumn("Store", value: \.store)
            TableColumn("Date") { transaction in
                Text(transaction.date.formatted(.dateTime.year().month().day()))
            }
            TableColumn("Amount") { transaction in
                Text(transaction.amount, format: .currency(code: "USD"))
            }
            TableColumn("Category", value: \.category.rawValue)
        }
        .background(PFColors.surface)
        .focused($isFocused)
        .onChange(of: isFocused, { oldFocus, newFocus in
            if newFocus {
                viewModel.fetchAllTransactions()
            }
        })
    }
}

#Preview {
    AmountView(viewModel: .init(customerID: Int64()))
}
