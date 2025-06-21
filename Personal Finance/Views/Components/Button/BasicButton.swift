//
//  BasicButton.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

struct BasicButton: View {
    let text: String

    let onTap: () -> Void

    var body: some View {
        Button {
            onTap()
        } label: {
            Text(text)
                .font(.system(size: 15, weight: .bold, design: .default))
                .padding(
                    .init(
                        top: 8,
                        leading: 24,
                        bottom: 8,
                        trailing: 24
                    )
                )
                .frame(maxWidth: .infinity)
        }
    }
}
