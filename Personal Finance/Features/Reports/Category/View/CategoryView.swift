//
//  CategoryView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/17/25.
//
import SwiftUI

struct CategoryView: View {
    @Environment(\.openWindow) private var openWindow
    @ObservedObject var viewModel: CategoryViewModel
    @EnvironmentObject var appState: AppState
    
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
        ScrollView{
            ForEach(viewModel.fetchTransactionsForCategory(category: category)) { transaction in
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
    CategoryView(viewModel: CategoryViewModel(customerID: Int64()))
}
