//
//  ItemsButton.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 11/11/25.
//
import SwiftUI

struct ItemsButton: View {
    let item: Transaction
    let onTapAction: () -> Void
    
    var body: some View {
        Button(action: onTapAction, label: {
            VStack(alignment: .leading) {
                HStack {
                    Text("Store:")
                        .fontWeight(.black)
                    Spacer()
                    Text(item.store)
                }
                
                HStack {
                    Text("Category: ")
                        .fontWeight(.black)
                    Spacer()
                    Text(item.category.rawValue)
                }
                
                HStack {
                    Text("Amount: ")
                        .fontWeight(.black)
                    Spacer()
                    Text(item.amount.formatted(.currency(code: "USD")))
                }
            }
            .frame(maxWidth: .infinity)
        }).buttonStyle(OutlinedButtonStyle(
            isDestructive: false,
            isDisabled: false
        )
)
    }
}

#Preview {
    ItemsButton(
        item: Transaction(
            id: 1,
            userID: 1,
            date: Date(),
            store: "Mama Joe's",
            amount: 8.76,
            category: CategoryType.entertainment,
            lastUpdated: Date()
        ),
        onTapAction: {}
    )
}
