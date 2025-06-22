//
//  AppState.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

class AppState: ObservableObject {
    enum ViewType {
        case calendar
        case list
        case signIn
        case signUp

        var title: String {
            switch self {
            case .calendar:
                return "Calendar"
            case .list:
                return "List"
            case .signIn:
                return "Sign In"
            case .signUp:
                return "Sign Up"
            }
        }
    }

    @Published var currentView: ViewType = .signIn
    @Published var isAddExpensePresented: Bool = false
}
