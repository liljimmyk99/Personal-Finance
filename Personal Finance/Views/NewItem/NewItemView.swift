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
            NewTransactionView()
                .tabItem {
                    Text("Transaction")
                }
            Text("New Income")
                .tabItem {
                    Text("Income")
                }
        }
        .tabViewStyle(.grouped)
    }
}

#Preview {
    NewItemView()
}
