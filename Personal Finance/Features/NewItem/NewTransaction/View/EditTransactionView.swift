//
//  EditTransactionView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct EditTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: EditTransactionViewModel
    
    var body: some View {
        VStack {
            TextInput(text: $viewModel.store, label: "Store", validationRules: nil)
            
            DateInput(date: $viewModel.date, label: "Transaction Date")
        
            CurrencyInput(amount: $viewModel.amount, label: "Cost")
            
            SelectInput(
                option: $viewModel.category,
                options: CategoryType.allCases,
                label: "Category"
            ).padding(.bottom)
            
            // TODO: Add AuthManager/AppState to get current signedIn User
            PFButton(text: "Submit") {
                do {
                   let transaction = try viewModel.createTransaction()
                    dismiss()
                    print("Created new Transaction: \(transaction)")
                } catch {
                    print("Error submitting transaction: \(error)")
                }
            }
        }
        .padding()
        .background(PFColors.surface)
        
    }
}

#Preview{
    EditTransactionView(viewModel: EditTransactionViewModel(
        customerID: Int64()
    ))
}
