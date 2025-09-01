//
//  InputFieldValidation.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/9/25.
//

enum InputFieldValidation {
    case success
    case failure(error: String)
}

enum InputFieldState: Equatable {
    case normal
    case error(error: String)
}
