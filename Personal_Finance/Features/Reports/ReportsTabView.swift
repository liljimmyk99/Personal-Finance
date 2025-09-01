//
//  ReportsView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 6/15/25.
//
import SwiftUI

struct ReportsTabView: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var appState: AppState
    @State var transactions: [Transaction] = []
    
    var body: some View {
        ZStack {
            TabView {
                // TODO: Create Calendar View
                CategoryView(
                    viewModel: CategoryViewModel(
                        customerID: appState.currentUser?.id
                    )
                )
                    .tabItem {
                        Text("Categories")
                    }
                MonthsView(
                    viewModel: MonthsViewModel(
                        customerID: appState.currentUser?.id
                    )
                )
                    .tabItem {
                        Text("Months")
                    }
            }
            VStack{
                Spacer()
                
                HStack{
                    Spacer()
                    
                    NewItemButton(
                        onTap: {
                            openWindow(id: "new-item")
                        }
                    )
                    .padding()
                }
            }
        }
        
    }
}

#Preview {
    ReportsTabView()
        .environmentObject(AppState())
}
