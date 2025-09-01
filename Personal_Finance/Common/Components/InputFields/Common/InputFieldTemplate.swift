//
//  InputFieldTemplate.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/29/25.
//
import SwiftUI

struct InputFieldTemplate<Content: View>: View {
    @Binding var inputState: InputFieldState
    let label: String
    var content: () -> Content
    
    var body: some View {
        VStack{
            HStack {
                Text(label)
                    .font(.headline)
                    .foregroundStyle(PFColors.headingText)
                    .padding(.bottom, 5)
            
                Spacer()
            }
            
           content()
            
            if case .error(let error) = inputState {
                HStack {
                    Text(error)
                        .font(.callout)
                        .foregroundColor(PFColors.destructiveButton)
                    
                    Spacer()
                }
            }
            
        }
        .padding()
    }
}
