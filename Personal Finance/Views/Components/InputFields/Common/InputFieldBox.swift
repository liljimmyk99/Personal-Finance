//
//  InputFieldTemplate.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/29/25.
//
import SwiftUI

struct InputFieldBox<Content: View>: View {
    let isInFocus: Bool
    let content: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(
                    isInFocus ? PFColors.primary : Color.clear,
                    lineWidth: 5)
                .background(isInFocus ? PFColors.textFieldActive : PFColors.textFieldStatic)
            
            HStack {
                content()
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(height: 30)
    }
}
