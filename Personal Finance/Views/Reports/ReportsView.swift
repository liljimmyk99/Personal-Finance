//
//  ReportsView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import SwiftUI

struct ReportsView: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var appState: AppState
    @State var transactions: [Transaction] = []

    var body: some View {
        ZStack {
            TabView {
                CategoryView(transactions: Transaction.demoData)
                    .tabItem {
                        Text("Amount")
                    }
                AmountView(transactions: Transaction.demoData)
                    .tabItem {
                        Text("Categories")
                    }
                MonthsView(transactions: Transaction.demoData)
                    .tabItem {
                        Text("Months")
                    }
            }
            VStack{
                Spacer()
                
                HStack{
                    Spacer()
                    
                    NewItemButton(onTap: {openWindow(id: "new-item")})
                }
            }
        }
        
    }
}

#Preview {
    ReportsView()
        .environmentObject(AppState())
}
