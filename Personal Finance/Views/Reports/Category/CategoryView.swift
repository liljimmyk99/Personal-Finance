//
//  CategoryView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//

import SwiftUI

struct CategoryView: View {
    @State var transactions: [Transaction] = []
    @State private var sortOrder: [KeyPathComparator<Transaction>] = [
        .init(\.store, order: .forward),
    ]

    var body: some View {
        Table(
            transactions.sorted(using: sortOrder),
            sortOrder: $sortOrder
        ) {
            TableColumn("Store", value: \.store)
            TableColumn("Date") { transaction in
                Text(transaction.date.formatted(.dateTime.year().month().day()))
            }
            TableColumn("Amount") { transaction in
                Text(transaction.amount, format: .currency(code: "USD"))
            }
            TableColumn("Category", value: \.category)
        }
    }
}

#Preview {
    CategoryView(transactions: Transaction.demoData)
}
