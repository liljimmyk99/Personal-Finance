//
//  NewItemView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//

import SwiftUI

struct NewItemView: View {
    var body: some View {
        TabView{
            EditTransactionView()
                .tabItem {
                    Text("Transaction")
                }
            NewIncomeView()
                .tabItem {
                    Text("Income")
                }
        }
    }
}

#Preview {
    NewItemView()
}
