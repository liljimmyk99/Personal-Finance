//
//  ItemsForDay.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 11/9/25.
//
import SwiftUI

struct ItemsForDay: View {
    @EnvironmentObject var appState: AppState
    
    let transactions: Transactions?
    
    var body: some View {
        Text("Hello, World! I have \(transactions?.data.count ?? 0) items for today.")
        ForEach(transactions?.data ?? []) { item in
            Text(item.toString())
        }
    }
}
