//
//  NewItemButton.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//
import SwiftUI

public struct NewItemButton: View {
    let onTap: () -> Void
    
    public var body: some View {
        Button(action: { onTap() }) {
            ZStack {
                Circle()
                    .foregroundStyle(PFColors.primary)
                    .frame(width: 75, height: 75)
                
                Image(systemName: "plus")
                    .resizable()
                    .padding()
                    .frame(width: 50, height: 50)
                
                
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    NewItemButton(onTap: {
        print("1234")
    })
}
