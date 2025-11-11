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
        case profile
        case splashScreen

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
            case .profile:
                return "Profile"
            case .splashScreen:
                return "Splash Screen"
            }
        }
    }

    @Published var currentUser: User? = nil
    @Published var currentView: ViewType = .splashScreen
    @Published var isMainWindowInFocus: Bool = false
}
