//
//  TransactionList.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/3/25.
//
import SwiftUI

struct TransactionList: View {
    @State private var selectedTransaction: Transaction?
    let transactions: [Transaction]
    let onEditButtonTap: (Transaction) -> Void
    let onDeleteButtonTap: (Transaction) -> Void

    var body: some View {
        VStack {
            TransactionListHeader()

            List(transactions, id: \.id) { transaction in
                TranactionListItem(transaction: transaction)
                    .background(
                        selectedTransaction == transaction
                            ? PFColors.primary.opacity(0.2)
                            : Color.clear
                    )
                    .onTapGesture {
                        selectedTransaction = transaction
                    }
                    .contextMenu(
                        menuItems: {
                            Button("Edit") {
                                onEditButtonTap(transaction)
                            }
                            .padding()

                            Button("Delete") {
                                onDeleteButtonTap(transaction)
                            }
                            .padding()
                        }
                    )
            }
        }
    }
}

#Preview {
    TransactionList(
        transactions: [Transaction.makeRandom()],
        onEditButtonTap: { _ in },
        onDeleteButtonTap: { _ in }
    )
}
