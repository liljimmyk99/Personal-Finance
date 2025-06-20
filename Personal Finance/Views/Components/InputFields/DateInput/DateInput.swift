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
        VStack{
            HStack {
                Text(label)
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Spacer()
            }
            Button{
                showDatePicker = true
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(
                            Color.blue,
                            lineWidth: 5)
                        .background(Color.secondary)
                    
                    HStack {
                        Text(date.formatted(.dateTime.month(.wide).day().year()))
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .frame(height: 30)
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
        .padding()
    }
}

#Preview {
    @Previewable @State var date = Date()
    
    DateInput(date: $date, label: "Some Label")
}
