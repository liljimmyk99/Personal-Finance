//
//  OutlinedButtonStyle.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

struct TextButtonStyle: ButtonStyle {
    let isDestructive: Bool
    let isDisabled: Bool

    func color(isPressed: Bool) -> Color {
        if isDisabled {
            return PFColors.textFieldDisabled
        }
        return if isDestructive {
            isPressed ? PFColors.destructiveButton.opacity(0.7) : PFColors.destructiveButton
        } else {
            isPressed ? PFColors.primary.opacity(0.7) : PFColors.primary
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.white.opacity(0.001))
            .foregroundColor(color(isPressed: configuration.isPressed))
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
