//
//  ActivityDetailView.swift
//  HabitTrack
//
//  Created by Uriel Ortega on 24/05/23.
//

import SwiftUI

struct ActivityDetailView: View {
    let activity: ActivityItem

    var body: some View {
        VStack {
            Text(activity.emoji)
                .font(.system(size: 100))
                .padding()
            Text(activity.title)
                .font(.system(size: 40, weight: .semibold, design: .rounded))
            Text(activity.description)
                .font(.subheadline)
            Spacer()
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static let activityExample = ActivityItem(title: "Drink water", description: "Drink more water", emoji: "💧")

    static var previews: some View {
        ActivityDetailView(activity: activityExample)
    }
}
