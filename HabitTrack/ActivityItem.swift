//
//  ActivityItem.swift
//  HabitTrack
//
//  Created by Uriel Ortega on 24/05/23.
//

import Foundation

struct ActivityItem: Identifiable, Codable, Equatable {
    var id = UUID()
    
    let title: String
    let description: String
    var emoji = "🌟"
    
    var completionCounter = 0
}
