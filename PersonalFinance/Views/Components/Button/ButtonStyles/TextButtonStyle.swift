//
//  OutlinedButtonStyle.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

struct TextButtonStyle: ButtonStyle {
    let isDestructive: Bool

    func color(isPressed: Bool) -> Color {
        return if isDestructive {
            isPressed ? Color.red.opacity(0.7) : Color.red
        } else {
            isPressed ? Color.green.opacity(0.7) : Color.green
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
