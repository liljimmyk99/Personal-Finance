//
//  TransactionInfo.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/31/25.
//
import SwiftUI

struct TransactionInfo: View {
    let numTransactions: Int
    let totalSpent: Double
    
    var body: some View {
            VStack {
                HStack() {
                    Text("Transactions:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(String(numTransactions))
                }
                
                Divider()
                    .padding(.vertical)
                
                HStack {
                    Text("Spent:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(
                        String(totalSpent.formatted(.currency(code: "USD")))
                    )
                }
            }
            .frame(width: 150, height: 50)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

#Preview {
    TransactionInfo(numTransactions: 5, totalSpent: 50.23)
}
