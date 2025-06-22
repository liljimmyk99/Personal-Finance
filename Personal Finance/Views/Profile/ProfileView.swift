//
//  ProfileView.swift
//  Personal Finance
//  Created by Jimmy Kane on 6/22/25.
//

import SwiftUI

struct ProfileView: View {
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text("First Name")
                    .font(.headline)
                Text(firstName)
                    .font(.subheadline)
                
                Text("Last Name")
                    .font(.headline)
                Text(lastName)
                    .font(.subheadline)
                
                Text("Email")
                    .font(.headline)
                Text(email)
                    .font(.subheadline)
                
                Text("Phone Number")
                    .font(.headline)
                Text(phoneNumber)
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView(
        firstName: "Jimbo",
        lastName: "Slice",
        email: "123@example.com",
        phoneNumber: "123-456-7890"
    )
}
