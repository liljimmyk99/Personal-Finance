//
//  CategoryView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/17/25.
//
import SwiftUI

struct CategoryView: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var appState: AppState
    @State var transactions: [Transaction] = []
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 100) {
                ForEach(CategoryType.allCases, id: \.self) { category in
                    VStack{
                        Text(category.rawValue)
                            .bold()
                    
                        transactionsForCategory(category)
                    }
                }
            }
            .padding()
            .background(PFColors.background)
        }
    }
    
    @ViewBuilder
    func transactionsForCategory(_ category: CategoryType) -> some View {
        let filteredTransactions: [Transaction] = transactions.filter{ $0.category == category }
        ScrollView{
            ForEach(filteredTransactions) { transaction in
                KanbanCard(
                    store: transaction.store,
                    amount: transaction.amount,
                    date: transaction.date,
                    onPress: {
                        openWindow(value: transaction)
                    }
                )
            }
        }
    }
}

#Preview {
    CategoryView(transactions: Transaction.demoData)
}
