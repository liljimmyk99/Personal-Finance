//
//  CalendarDay.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//

import SwiftUI

private struct CalendarDayButton<Content: View>: View {
    let content: () -> Content
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            content()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

private struct CalendarDayLabel<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        VStack {
            content()
        }
    }
}

struct CalendarDay: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.openWindow) private var openWindow
    let model: TransactionDateModel?

    var body: some View {
        Button(action: handleDayTap) {
            VStack {
                HStack {
                    if let date = model?.dateNumber {
                        Text("\(date)")
                            .font(.title2)
                        Spacer()
                    }
                }
                
                Spacer()
                
                if let model = model, model.transactions.isEmpty == false {
                    HStack {
                        Text("\(model.numTransactions) / $\(model.totalSpent)")
                            .font(.caption2)
                            .foregroundStyle(fontColor)
                    }
                }
                
                Spacer()
            }
            .padding()
            .frame(width: 100, height: 100)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
        .border(borderColor)
        .background(backgroundColor)
        .disabled(isTransactionsEmpty)
    }
    
    private var isTransactionsEmpty: Bool {
        guard let model = model else {
            return true 
        }
        return model.transactions.isEmpty
    }

    @ViewBuilder
    private var calendarContent: some View {
        VStack {
            HStack {
                if let date = model?.dateNumber {
                    Text("\(date)")
                        .font(.title2)
                    Spacer()
                }
            }

            Spacer()

            if let model = model, model.transactions.isEmpty == false {
                HStack {
                    Text("\(model.numTransactions) / $\(model.totalSpent)")
                        .font(.caption2)
                        .foregroundStyle(fontColor)
                }
            }

            Spacer()
        }
    }
    
    private var backgroundColor: Color {
        return if model == nil {
            PFColors.textFieldDisabled
        } else {
            Color.black.opacity(0.001)
        }
    }

    private var borderColor: Color {
        return if model == nil {
            Color.clear
        } else {
            Color.black
        }
    }

    private var fontColor: Color {
        return if let model = model?.transactions {
            if model.count < 3 {
                Color.green
            } else if model.count < 5 {
                Color.yellow
            } else {
                Color.red
            }
        } else {
            Color.clear
        }
    }
    
    private func handleDayTap() {
        guard let model else {
            return
        }
        openWindow(value: Transactions(data: model.transactions))
    }
}

#Preview("No Transactions") {
    CalendarDay(
        model: TransactionDateModel(
            date: .init(),
            dateNumber: 1,
            transactions: []
        )
    )
    .padding()
}

#Preview("Good Spending") {
    CalendarDay(
        model: TransactionDateModel(
            date: .init(),
            dateNumber: 1,
            transactions: [
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
            ]
        )
    )
    .padding()
}

#Preview("Moderate Spending") {
    CalendarDay(
        model: TransactionDateModel(
            date: .init(),
            dateNumber: 1,
            transactions: [
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
            ]
        )
    )
    .padding()
}

#Preview("Bad Spending") {
    CalendarDay(
        model: TransactionDateModel(
            date: .init(),
            dateNumber: 1,
            transactions: [
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
                .init(
                    userID: Int64(),
                    date: .init(),
                    store: "",
                    amount: 180.0,
                    category: .other,
                    lastUpdated: .init()
                ),
            ]
        )
    )
    .padding()
}
