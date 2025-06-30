//
//  SelectInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

struct SelectInput<T: CaseIterable & RawRepresentable & Hashable>: View where T.RawValue == String {
    @State private var showOptions = false
    @Binding var option: T
    let options: [T]
    let label: String
    let placeholder: String? = nil
    
    var body: some View {
        InputFieldTemplate(label: label) {
                Button{
                    showOptions = true
                } label : {
                    
                InputFieldBox(isInFocus: showOptions) {
                        Text(option.rawValue)
                            .font(.title2)
                }
                .buttonStyle(.plain)
                .popover(
                    isPresented: $showOptions,
                    attachmentAnchor: .point(UnitPoint(x: 0.15, y: 0)),
                    content: {
                        Picker(label, selection: $option) {
                            ForEach(options, id: \.self) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                        .datePickerStyle(.graphical)
                        .padding()
                    }
                )
            }
        }
    }
}

#Preview {
    @Previewable @State var option: CategoryType = .debt
    
    SelectInput(
        option: $option,
        options: CategoryType.allCases,
        label: "Category"
    )
}
