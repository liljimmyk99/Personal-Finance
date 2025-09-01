//
//  NewIncomeView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct NewIncomeView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: NewIncomeViewModel
    @State var source: String = ""
    @State var date: Date = Date()
    @State var grossAmount: String = "0.00"
    @State var grossTaxableAmount: String = "0.00"
    @State var netAmount: String = "0.00"
    
    var body: some View {
        VStack {
            ScrollView {
                TextInput(
                    text: $source,
                    label: "Source",
                    validationRules: nil
                )
                
                DateInput(date: $date, label: "Income Date")
                
                CurrencyInput(
                    amount: $grossAmount,
                    label: "Gross Income Amount"
                )
                
                CurrencyInput(
                    amount: $grossTaxableAmount,
                    label: "Gross Taxable Amount"
                )
                
                CurrencyInput(
                    amount: $netAmount,
                    label: "Net Taxable Amount"
                )
                
            }
            .padding()
            
            // TODO: Add AuthManager/AppState to get current signedIn User
            PFButton(text: "Submit") {
                do {
                   let income = try viewModel.createIncome()
                    dismiss()
                    print("Created new Transaction: \(income)")
                } catch {
                    print("Error submitting transaction: \(error)")
                }

            }
            .padding(.bottom)
        }
        .padding()
        .background(PFColors.surface)
        
    }
}

#Preview{
    NewIncomeView(
        viewModel: NewIncomeViewModel(customerID: Int64())
    )
}
