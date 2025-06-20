//
//  TextInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct TextInput: View {
    @Binding var text: String
    let label: String
    let placeholder: String? = nil
    
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
                    TextField(placeholder ?? "", text: $text)
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
    @Previewable @State var text = ""
    TextInput(text: $text, label: "Some Label")
}
