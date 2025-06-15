//
//  ReportsView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import SwiftUI

struct ReportsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView {
            NotImplementedView(featureName: appState.currentView.title)
                .tabItem {
                    Text("Amount")
                }
            CategoryView(transactions: Transaction.demoData)
                .tabItem {
                    Text("Categories")
                }
            MonthsView(transactions: Transaction.demoData)
                .tabItem {
                    Text("Months")
                }
        }
    }
}

#Preview {
    ReportsView()
        .environmentObject(AppState())
}
