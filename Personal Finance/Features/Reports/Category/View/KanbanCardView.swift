//
//  KanbanCardView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/18/25.
//

import SwiftUI

struct KanbanCard: View {
    let store: String
    let amount: Double
    let date: Date
    
    let onPress: () -> Void
    
    var body: some View {
        Button {
            onPress()
        } label: {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 250, height: 150)
                .overlay{
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text(store)
                                .font(.title2)
                                .foregroundStyle(PFColors.headingText)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Text(date.formatted(.dateTime.month().day().year()))
                                .foregroundStyle(PFColors.mainText)
                            
                            Spacer()
                            
                            Text(amount, format: .currency(code: "USD"))
                                .font(.headline)
                                .foregroundStyle(PFColors.mainText)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(PFColors.surface)
                }
        }
        .buttonStyle(PlainButtonStyle())
        .overlay(
            // Overlay a new RoundedRectangle and stroke it
            RoundedRectangle(cornerRadius: 5)
                .stroke(PFColors.primary, lineWidth: 5)
        )
        .padding()
    }
}

#Preview {
    KanbanCard(
        store: "Some long store name",
        amount: 123.45,
        date: Date()
    ) {
        print("21")
    }
}
