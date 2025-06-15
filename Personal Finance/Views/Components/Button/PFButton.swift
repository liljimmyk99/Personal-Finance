//
//  PFButton.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//

import SwiftUI

struct PFButton: View {
    let text: String

    let type: PFButtonType

    let style: PFButtonStyle

    let onTap: () -> Void

    enum PFButtonStyle {
        case filled
        case outlined
        case text
    }

    enum PFButtonType {
        case normal
        case destructive
    }

    public init(text: String, type: PFButtonType = .normal, style: PFButtonStyle = .filled, onTap: @escaping () -> Void) {
        self.text = text
        self.type = type
        self.style = style
        self.onTap = onTap
    }

    var body: some View {
        switch style {
        case .filled:
            BasicButton(text: text, onTap: onTap)
                .buttonStyle(FilledButtonStyle(isDestructive: type == .destructive))
        case .outlined:
            BasicButton(text: text, onTap: onTap)
                .buttonStyle(OutlinedButtonStyle(isDestructive: type == .destructive))
        default:
            BasicButton(text: text, onTap: onTap)
                .buttonStyle(TextButtonStyle(isDestructive: type == .destructive))
        }
    }
}

#Preview("Normal") {
    PFButton(text: "Filled") {
        print("Hello")
    }
    .padding()

    PFButton(text: "Outlined", style: .outlined) {
        print("Hello")
    }
    .padding()
    PFButton(text: "Text", style: .text) {
        print("Hello")
    }
    .padding()
}

#Preview("Destructive") {
    PFButton(text: "Filled", type: .destructive) {
        print("Hello")
    }
    .padding()

    PFButton(text: "Outlined", type: .destructive, style: .outlined) {
        print("Hello")
    }
    .padding()
    PFButton(text: "Text", type: .destructive, style: .text) {
        print("Hello")
    }
    .padding()
}
