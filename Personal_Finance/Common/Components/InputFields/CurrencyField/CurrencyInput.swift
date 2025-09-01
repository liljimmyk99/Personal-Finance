//
//  CurrencyInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct CurrencyInput: View {
    @FocusState private var isInFocus: Bool
    @State private var textFieldState: InputFieldState = .normal
    @Binding var amount:  String
    let label: String

    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var body: some View {
        InputFieldTemplate(
            inputState: $textFieldState,
            label: label
        ) {
            InputFieldBox(
                inputState: $textFieldState,
                isInFocus: isInFocus
            ) {
                TextField(
                    "Amount",
                    text: $amount
                )
                    .textFieldStyle(.plain)
                    .font(.title2)
                    .focused($isInFocus)
                    .onChange(of: amount) { _, newValue in
                        reformatInput(newValue, isInFocus)
                    }
                    .onChange(of: isInFocus) { _, newValue in
                        if !newValue {
                            reformatInput(amount, isInFocus)
                        }
                    }
                    .onAppear {
                        reformatInput(amount, false)
                    }
            }
        }
    }
    
    private func reformatInput(_ newValue: String, _ isInFocus: Bool) {
        
        if isInFocus {
            textFieldState = .normal
            return
        }
        
        let clean = newValue.filter {
            return "0123456789.".contains($0)
        }
        
        if let number = Double(clean) {
            amount = currencyFormatter.string(
                from: number as NSNumber
            ) ?? "$0.00"
            textFieldState = .normal
        } else {
            amount = "$0.00"
            textFieldState = .error(
                error: "Invalid currency input"
            )
            
        }
    }
}

#Preview {
    @Previewable @State var text: String = ""
    CurrencyInput(amount: $text, label: "Some Label")
    CurrencyInput(amount: .constant("0.00"), label: "Other Field")
}
