//
//  NewTransactionView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct NewTransactionView: View {
    @State var store: String = ""
    @State var date: Date = Date()
    @State var category: CategoryType = .other
    @State var amount: Double = 0.0
    
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
        }
        .padding()
        
    }
}

#Preview{
    NewTransactionView()
}
