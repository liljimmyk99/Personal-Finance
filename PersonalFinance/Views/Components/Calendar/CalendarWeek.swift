//
//  CalendarWeek.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//

import SwiftUI

struct CalendarWeek: View {
    var body: some View {
        HStack {
            ForEach(0 ..< 7) {
                CalendarDay(date: "\($0)")
            }
        }
    }
}

#Preview {
    CalendarWeek()
        .padding()
}
