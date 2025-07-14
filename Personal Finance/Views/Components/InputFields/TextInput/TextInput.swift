//
//  TextInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct TextInput: View {
    @FocusState private var isInFocus: Bool
    @Binding var text: String
    let label: String
    let placeholder: String? = nil
    
    var body: some View {
        InputFieldTemplate(label: label) {
            InputFieldBox(isInFocus: isInFocus) {
                TextField(placeholder ?? "", text: $text)
                    .textFieldStyle(.plain)
                    .font(.title2)
                    .focused($isInFocus)
            }
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    TextInput(text: $text, label: "Some Label")
}
