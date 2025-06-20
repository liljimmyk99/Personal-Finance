//
//  CurrencyInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct CurrencyInput: View {
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
        VStack{
            HStack {
                Text(label)
                    .font(.headline)
                    .padding(.bottom, 5)
            
                Spacer()
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(
                        Color.blue,
                        lineWidth: 5)
                    .background(Color.secondary)
                
                HStack {
                    TextField(
                        "Amount",
                        value: $amount,
                        formatter: currencyFormatter
                    )
                    .textFieldStyle(.plain)
                    .font(.title2)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .frame(height: 30)
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var text = 0.0
    CurrencyInput(amount: $text, label: "Some Label")
}
