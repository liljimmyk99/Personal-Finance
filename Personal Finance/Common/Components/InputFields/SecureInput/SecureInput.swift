//
//  TextInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct SecureInput: View {
    @FocusState private var isInFocus: Bool
    @State private var textFieldState: InputFieldState = .normal
    @Binding var text: String
    let label: String
    let validationRules: ((String, Bool) -> InputFieldValidation)?

    var body: some View {
        InputFieldTemplate(inputState: $textFieldState, label: label) {
            InputFieldBox(inputState: $textFieldState, isInFocus: isInFocus) {
                SecureField(text: $text) {}
                    .textFieldStyle(.plain)
                    .focused($isInFocus)
                    .onChange(of: text) { _, _ in
                        if let validationRules = validationRules {
                            let result = validationRules(text, isInFocus)
                            switch result {
                            case .success:
                                textFieldState = .normal
                            case let .failure(error: error):
                                textFieldState = .error(error: error)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    SecureInput(text: $text, label: "Some Label", validationRules: { text, _ in
        if text.contains(where: { $0.isNumber }) {
            return InputFieldValidation.success
        } else {
            return InputFieldValidation.failure(error: "Not a number")
        }
    })
}
