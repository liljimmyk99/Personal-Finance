//
//  ProfileView.swift
//  Personal Finance
//  Created by Jimmy Kane on 6/22/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    var firstName: String = "Jimbo"
    var lastName: String = "Slice"
    var email: String = "123@example.com"
    var phoneNumber: String = "123-456-7890"
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80)
            HStack {
                VStack(alignment: .leading) {
                    Text("First Name")
                        .font(.title2)
                        .foregroundStyle(PFColors.headingText)
                    Text(firstName)
                        .font(.headline)
                        .foregroundStyle(PFColors.mainText)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("Last Name")
                        .font(.title2)
                        .foregroundStyle(PFColors.headingText)
                    Text(lastName)
                        .font(.headline)
                        .foregroundStyle(PFColors.mainText)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("Email")
                        .font(.title2)
                        .foregroundStyle(PFColors.headingText)
                    Text(email)
                        .font(.headline)
                        .foregroundStyle(PFColors.mainText)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("Phone Number")
                        .font(.title2)
                        .foregroundStyle(PFColors.headingText)
                    
                    Text(phoneNumber)
                        .font(.headline)
                        .foregroundStyle(PFColors.mainText)
                }
                
                Spacer()
            }
            HStack {
                PFButton(text: "Go Back", type: .destructive) {
                    appState.currentView = .list
                }
                
                PFButton(text: "Edit", isDisabled: true) {
                    print("Not implemented yet")
                }
            }
        }
        .frame(width: 300, height: 400)
        .padding()
        .background(PFColors.background)
    }
}

#Preview {
    ProfileView()
}
