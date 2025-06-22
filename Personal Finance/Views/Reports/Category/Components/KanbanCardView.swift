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
                                .foregroundStyle(Color.green)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Text(date.formatted(.dateTime.month().day().year()))
                                .foregroundStyle(Color.green)
                            
                            Spacer()
                            
                            Text(amount, format: .currency(code: "USD"))
                                .font(.headline)
                                .foregroundStyle(Color.green)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray)
                }
                .overlay(
                    // Overlay a new RoundedRectangle and stroke it
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.green, lineWidth: 5)
                )
        }
        .buttonStyle(PlainButtonStyle())
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
