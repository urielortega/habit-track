//
//  ContentView.swift
//  HabitTrack
//
//  Created by Uriel Ortega on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities() // To create the shared data.
    @State private var showingAddActivity = false
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { item in
                    NavigationLink {
                        ActivityDetailView(activities: activities, activity: item)
                    } label: {
                        HStack {
                            Text(item.emoji)
                                .frame(width: 50, height: 50)
                                .background(.regularMaterial, in: Circle())
                            Text(item.title)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("HabitTrack")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
