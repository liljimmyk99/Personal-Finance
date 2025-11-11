//
//  Calendar.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 9/6/25.
//
import SwiftUI

struct CalendarView: View {
    @ObservedObject var viewModel: CalendarViewViewModel = .init(customerID: Int64())
    
    var body: some View {
        VStack{
            ZStack {
                HStack {
                    TransactionInfo(
                        numTransactions: viewModel.numTransactions,
                        totalSpent: viewModel.totalSpent
                    )
                    .padding(.leading)

                    Spacer()
                }
                CalendarMonthSelector(selectedMonth: $viewModel.selectedMonth)
            }
            .padding(.vertical, 8)
            
            CalendarMonth()
        }
        .environmentObject(viewModel)
    }
}
