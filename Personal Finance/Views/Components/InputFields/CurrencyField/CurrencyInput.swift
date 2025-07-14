//
//  CurrencyInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct CurrencyInput: View {
    @FocusState private var isInFocus: Bool
    @Binding var amount: Double
    let label: String
    let placeholder: String? = nil
    
    private var currencyFormatter: NumberFormatter {
           let formatter = NumberFormatter()
           formatter.numberStyle = .currency
           formatter.maximumFractionDigits = 2
           formatter.locale = Locale.current
           return formatter
       }
    
    var body: some View {
        InputFieldTemplate(label: label) {
            InputFieldBox(isInFocus: isInFocus) {
                TextField(
                    "Amount",
                    value: $amount,
                    formatter: currencyFormatter
                )
                .textFieldStyle(.plain)
                .font(.title2)
                .focused($isInFocus)
            }
        }
    }
}

#Preview {
    @Previewable @State var text = 0.0
    CurrencyInput(amount: $text, label: "Some Label")
}
