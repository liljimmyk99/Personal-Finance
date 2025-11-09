//
//  InputFieldTemplate.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/29/25.
//
import SwiftUI

struct InputFieldBox<Content: View>: View {
    @Binding var inputState: InputFieldState
    let isInFocus: Bool
    let content: () -> Content

    var backgroundColor: Color {
        isInFocus ? PFColors.textFieldActive : PFColors.textFieldStatic
    }

    var borderColor: Color {
        if inputState != .normal {
            return PFColors.destructiveButton
        }

        return isInFocus ? PFColors.primary : Color.clear
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(borderColor, lineWidth: 5)
                .background(backgroundColor)

            HStack {
                content()

                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(height: 30)
    }
}
