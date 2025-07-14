//
//  DateInput.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//

import SwiftUI

struct DateInput: View {
    @State private var showDatePicker = false
    @Binding var date: Date
    let label: String
    let placeholder: String? = nil
    
    var body: some View {
        InputFieldTemplate(label: label) {
                Button{
                    showDatePicker = true
                } label : {
                InputFieldBox(isInFocus: showDatePicker) {
                    Text(date.formatted(.dateTime.month(.wide).day().year()))
                        .font(.title2)
                }
            }
            .buttonStyle(.plain)
            .popover(
                isPresented: $showDatePicker,
                attachmentAnchor: .point(UnitPoint(x: 0.15, y: 0)),
                content: {
                    DatePicker(
                        "",
                        selection: $date,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                    .padding()
                }
            )
        }
    }
}

#Preview {
    @Previewable @State var date = Date()
    
    DateInput(date: $date, label: "Some Label")
}
