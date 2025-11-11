//
//  TransActionListHeader.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/3/25.
//
import SwiftUI

struct TransactionListHeader: View {
    var body: some View {
        HStack {
            Text("Store")
                .font(.title3)
            Spacer()
            Text("Category")
                .font(.title3)
                .padding(.trailing, 20)
            Text("Amount")
                .font(.title3)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}
