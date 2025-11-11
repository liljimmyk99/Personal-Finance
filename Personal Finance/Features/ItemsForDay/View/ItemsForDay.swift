//
//  ItemsForDay.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 11/9/25.
//
import SwiftUI

struct ItemsForDay: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismiss) private var dismiss
    
    let transactions: Transactions?
    
    var body: some View {
        VStack {
            Text("Hello, World! I have \(transactions?.data.count ?? 0) items for \(transactions?.data.first?.date.formatted(date: .numeric, time: .omitted) ?? "").")
            VStack {
                ForEach(transactions?.data ?? []) { item in
                    ItemsButton(
                        item: item,
                        onTapAction: {
                            openWindow(value: item)
                            dismiss()
                        })
                }
            }.frame(width: 300)
                .padding()
        }
    }
}

#Preview {
    ItemsForDay(
        transactions: Transactions(
            data: [
                Transaction(
                    id: 1,
                    userID: 1,
                    date: Date(),
                    store: "Mama Joe's",
                    amount: 8.76,
                    category: CategoryType.entertainment,
                    lastUpdated: Date()
                ),
                Transaction(
                    id: 2,
                    userID: .zero,
                    date: Date(),
                    store: "Joe Mama's",
                    amount: 67.78,
                    category: CategoryType.food,
                    lastUpdated: Date()
                )
            ]
        )
    )
}
