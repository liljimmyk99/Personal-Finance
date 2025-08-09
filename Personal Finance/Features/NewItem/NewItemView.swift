//
//  NewItemView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//

import SwiftUI

struct NewItemView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        TabView{
            EditTransactionView(
                viewModel: EditTransactionViewModel(
                    customerID: appState.currentUser?.id
                )
            )
            .tabItem {
                Text("Transaction")
            }
            NewIncomeView(
                viewModel: NewIncomeViewModel(
                    customerID: appState.currentUser?.id
                )
            )
            .tabItem {
                Text("Income")
            }
        }
    }
}

#Preview {
    NewItemView()
}
