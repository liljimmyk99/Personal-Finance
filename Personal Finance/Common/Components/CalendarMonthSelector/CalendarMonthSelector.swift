//
//  CalendarMonthSelector.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/31/25.
//

import SwiftUI

struct CalendarMonthSelector: View {
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
    }
}
