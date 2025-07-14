//
//  NewTransactionView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct EditTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var store: String
    @State private var date: Date
    @State private var category: CategoryType
    @State private var amount: Double
    
    init(
        transaction: Transaction? = nil
    ) {
        self.store = transaction?.store ?? ""
        self.date = transaction?.date ?? Date()
        self.amount = transaction?.amount ?? 0.0
        self.category = transaction?.category ?? .other
    }
    
    var body: some View {
        VStack {
            TextInput(text: $store, label: "Store")
            
            DateInput(date: $date, label: "Transaction Date")
        
            CurrencyInput(amount: $amount, label: "Cost")
            
            SelectInput(
                option: $category,
                options: CategoryType.allCases,
                label: "Category"
            ).padding(.bottom)
            
            PFButton(text: "Submit") {
                let transaction = Transaction(
                    date: date,
                    store: store,
                    amount: amount,
                    category: category
                )
                dismiss()
                print("Created new Transaction: \(transaction)")
            }
        }
        .padding()
        .background(PFColors.surface)
        
    }
}

#Preview{
    EditTransactionView()
}
