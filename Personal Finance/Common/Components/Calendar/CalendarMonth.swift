//
//  CalendarMonth.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//

import SwiftUI

struct CalendarMonth: View {
    var body: some View {
        VStack {
            ForEach(0 ..< 5) { _ in
                CalendarWeek()
            }
        }
    }
}

#Preview {
    CalendarMonth()
        .padding()
}
