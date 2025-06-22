//
//  NewIncomeView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct NewIncomeView: View {
    @Environment(\.dismiss) private var dismiss
    @State var source: String = ""
    @State var date: Date = Date()
    @State var grossAmount: Double = 0.0
    @State var grossTaxableAmount: Double = 0.0
    @State var netAmount: Double = 0.0
    
    var body: some View {
        VStack {
            ScrollView {
                TextInput(text: $source, label: "Source")
                
                DateInput(date: $date, label: "Income Date")
                
                CurrencyInput(amount: $grossAmount, label: "Gross Income Amount")
                
                CurrencyInput(amount: $grossTaxableAmount, label: "Gross Taxable Amount")
                
                CurrencyInput(amount: $netAmount, label: "Net Taxable Amount")
                
            }
            .padding()
            
            PFButton(text: "Submit") {
                let income = Income(
                    date: date,
                    source: source,
                    grossAmount: grossAmount,
                    grossTaxableAmount: grossTaxableAmount,
                    netAmount: netAmount,
                    lastUpdated: Date()
                )
                print("Created new Income: \(income)")
                dismiss()
            }
            .padding(.bottom)
        }
        .padding()
        
    }
}

#Preview{
    NewIncomeView()
}
