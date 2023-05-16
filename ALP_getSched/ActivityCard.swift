//
//  ActivityCard.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI


struct ActivityCard: View {
    let activity: ActivityModel
    
    let date = Date()
    let dateFormatter = DateFormatter()

    
//    let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .short
//        return formatter
//    }()
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(activity.activityname)
                        .font(.headline)
                    Spacer()
                    Text(dateFormatter.string(from: activity.time) )
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(dateFormatter.string(from: activity.date))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Text(activity.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                HStack {
                    Text("Project/Personal")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            VStack {
                Image(systemName: "checkmark.circle")
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                .padding()
            }
        }
        
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var activity = ActivityModel.sampleActivity[0]
    static var previews: some View {
        ActivityCard(activity: activity)
    }
}
