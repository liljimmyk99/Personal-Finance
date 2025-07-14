//
//  CalendarDay.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//

import SwiftUI

struct CalendarDay: View {
    let date: String

    var body: some View {
        VStack {
            HStack {
                Text(date)
                Spacer()
            }
            Spacer()
        }
        .padding()
        .frame(width: 100, height: 100)
        .border(.black)
    }
}

#Preview {
    CalendarDay(date: "1")
        .padding()
}
