//
//  CalendarMonth.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//

import SwiftUI

struct CalendarMonth: View {
    @EnvironmentObject var viewModel: CalendarViewViewModel

    var body: some View {
        VStack {
            ForEach(0 ..< 6) { index in
                CalendarWeek(
                    model: viewModel.getDateNumberByWeek(weekIndex: index)
                )
            }
        }
        .onChange(of: viewModel.selectedMonth) { _, _ in
            viewModel.updateTransactions()
        }
    }
}

#Preview {
    CalendarMonth()
        .padding()
}
