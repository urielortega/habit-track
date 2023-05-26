//
//  ActivityDetailView.swift
//  HabitTrack
//
//  Created by Uriel Ortega on 24/05/23.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activities: Activities // To use the shared data in this View.
    let activity: ActivityItem

    var body: some View {
        VStack {
            VStack {
                Text(activity.emoji)
                    .font(.system(size: 100))
                    .padding()
                Text(activity.title)
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                Text(activity.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            
            VStack {
                Text("You've completed this activity")
                    .font(.subheadline)
                Text(String(activity.completionCounter))
                    .font(.system(size: 60, weight: .semibold, design: .rounded))
                Text(activity.completionCounter == 1 ? "time so far!" : "times so far!")
                    .font(.subheadline)
                
                Spacer()
                
                Button {
                    incrementActivityCounter()
                } label: {
                    RoundedMaterialButton(activity: activity)
                }
                .padding()
            }
        }
        .padding()
    }
    
    func incrementActivityCounter() {
        // Find the index of the original activity in the activities array.
        let activityIndex = activities.items.firstIndex(of: activity)

        // Make a copy of the activity to increase the completionCounter.
        var newActivity = activity
        newActivity.completionCounter += 1
        
        // Replace the original activity with the new one.
        activities.items[activityIndex!] = newActivity
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static let activityExample = ActivityItem(title: "Drink water", description: "Drink more water", emoji: "💧")

    static var previews: some View {
        ActivityDetailView(activities: Activities(), activity: activityExample)
    }
}

struct RoundedMaterialButton: View {
    let activity: ActivityItem

    var body: some View {
        // Text("Add another one!")
        Text(activity.completionCounter == 0 ? "Add the first one!" : "Add another one!")
            .font(.title2.bold())
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.25), radius: 10)
            .padding()
    }
}
