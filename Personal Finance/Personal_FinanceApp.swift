//
//  Personal_FinanceApp.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/25/24.
//
import SwiftData
import SwiftUI

@main
struct Personal_FinanceApp: App {
    @StateObject var appState = AppState()
    @StateObject var authManager: AuthenticationManager = AuthenticationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .environmentObject(authManager)
        }
        
        WindowGroup(for: Transaction.self) { $transaction in
            EditTransactionView(
                viewModel: EditTransactionViewModel(
                    transaction: transaction,
                    customerID: appState.currentUser?.id
                )
            )
            .environmentObject(appState)
            .onAppear() {
                appState.isMainWindowInFocus = false
            }
            .onDisappear() {
                appState.isMainWindowInFocus = true
            }
        }
        
        WindowGroup(id: "new-item") {
            NewItemView()
                .frame(
                    minWidth: 500,
                    maxWidth: .infinity,
                    minHeight: 500,
                    maxHeight: .infinity
                )
                .environmentObject(appState)
                .onAppear() {
                    appState.isMainWindowInFocus = false
                }
                .onDisappear() {
                    appState.isMainWindowInFocus = true
                }
        }
    }
}
