//
//  PrimaryButtonStyle.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

struct FilledButtonStyle: ButtonStyle {
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
            .background(color(isPressed: configuration.isPressed))
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(PFColors.secondary, lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 100))
            .foregroundColor(PFColors.mainText)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
