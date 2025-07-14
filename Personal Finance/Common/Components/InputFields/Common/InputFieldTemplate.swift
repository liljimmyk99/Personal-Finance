//
//  InputFieldTemplate.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/29/25.
//
import SwiftUI

struct InputFieldTemplate<Content: View>: View {
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
        }
        .padding()
    }
}
