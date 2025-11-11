//
//  TextInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct TextInput: View {
    @FocusState private var isInFocus: Bool
    @State private var textFieldState: InputFieldState = .normal
    @Binding var text: String
    let label: String
    let placeholder: String? = nil
    let validationRules: ((String, Bool) -> InputFieldValidation)?

    var body: some View {
        InputFieldTemplate(inputState: $textFieldState, label: label) {
            InputFieldBox(inputState: $textFieldState, isInFocus: isInFocus) {
                TextField(placeholder ?? "", text: $text)
                    .textFieldStyle(.plain)
                    .font(.title2)
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
    TextInput(text: $text, label: "Some Label") { text, _ in
        if text.contains(where: { $0.isNumber }) {
            return InputFieldValidation.success
        } else {
            return InputFieldValidation.failure(error: "Provide numbers only")
        }
    }
}
