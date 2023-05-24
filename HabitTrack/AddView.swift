//
//  AddView.swift
//  HabitTrack
//
//  Created by Uriel Ortega on 24/05/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities // To use the shared data in this View.
    @Environment(\.dismiss) var dismiss
    
    let emojis = ["🌟", "🧘", "📖", "🍎", "💧", "💤", "🏋️", "🚶‍♂️"]
    
    @State private var selectedEmoji = "🌟"
    @State private var title = ""
    @State private var description = ""
    @State private var amount = 0.0
    
    struct EmojiView: View {
        let emoji: String
        let isSelected: Bool
        let onTap: () -> Void

        var body: some View {
            Text(emoji)
                .font(.system(size: 50))
                .padding(5)
                .background(isSelected ? .accentColor : Color.clear)
                .clipShape(Circle())
                .onTapGesture(perform: onTap)
        }
    }
    
    var body: some View {
        NavigationStack {
            // EmojiPicker:
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(emojis, id: \.self) { emoji in
                        EmojiView(emoji: emoji, isSelected: emoji == selectedEmoji) {
                            selectedEmoji = emoji
                        }
                    }
                }
                .padding()
            }
            Form {
                TextField("Activity title", text: $title)
                TextField("Activity description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    let item = ActivityItem(title: title, description: description, emoji: selectedEmoji)
                    activities.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
