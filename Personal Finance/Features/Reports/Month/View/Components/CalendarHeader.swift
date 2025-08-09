//
//  CalendarHeader.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/3/25.
//
import SwiftUI

struct CalendarHeader: View {
    @Binding var selectedMonth: Date
    
    var body: some View {
        HStack {
            Button {
                selectedMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedMonth) ?? selectedMonth
            } label: {
                Image(systemName: "chevron.left")
            }

            Text(selectedMonth.formatted(.dateTime.month(.wide).year()))
            
            Button {
                selectedMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedMonth) ?? selectedMonth
            } label: {
                Image(systemName: "chevron.right")
            }
        }
        .padding(.vertical, 8)
    }
}
