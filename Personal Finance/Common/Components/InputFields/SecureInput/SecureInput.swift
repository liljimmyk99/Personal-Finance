//
//  TextInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct SecureInput: View {
    @FocusState private var isInFocus: Bool
    @Binding var text: String
    let label: String
    
    var body: some View {
        InputFieldTemplate(label: label) {
            InputFieldBox(isInFocus: isInFocus) {
                SecureField(text: $text) {}
                    .textFieldStyle(.plain)
                    .focused($isInFocus)
            }
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    SecureInput(text: $text, label: "Some Label")
}
