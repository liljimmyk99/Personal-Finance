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

            PFButton(
                text: "Submit",
                isDisabled: viewModel.isTransactionValid == false
            ) {
                do {
                    _ = try viewModel.createTransaction()
                    dismiss()
                } catch {
                    print("Error submitting transaction: \(error)")
                }
            }
        }
        .padding()
        .background(PFColors.surface)
    }
}

#Preview {
    EditTransactionView(viewModel: EditTransactionViewModel(
        customerID: Int64()
    ))
}
