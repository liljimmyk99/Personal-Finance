//
//  TranactionListItem.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/3/25.
//
import SwiftUI

struct TranactionListItem: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            Text(transaction.store)
            Spacer()
            Text(transaction.category.rawValue)
            Text(
                transaction.amount,
                format: .currency(code: "USD")
            )
            .fontWeight(.medium)
        }
        .contentShape(Rectangle())
        .padding()
        
    }
}
