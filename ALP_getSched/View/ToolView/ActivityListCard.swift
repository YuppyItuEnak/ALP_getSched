//
//  ActivityListCard.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import SwiftUI

struct ActivityListCard: View {
    let activity: ActivityModel
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(activity.activityName)
                        .font(.title)
                    Spacer()
                    Image(systemName: activity.isComplete ? "checkmark.circle": "circle")
                        .foregroundColor(activity.isComplete ? .green: .red)
                }
                HStack{
                    Text(activity.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    if activity.isCategory == "Project"{
                        Text("Project")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    if activity.isCategory == "Personal"{
                        Text("Personal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                HStack{
                    Text(activity.date)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(activity.time)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ActivityListCard_Previews: PreviewProvider {
    static var activity1 = ActivityModel(activityName: "First Item", description: "First Description", date: "May 15, 2023", time: "12:00 AM", isComplete: false, isCategory: "Personal")
    
    static var activity2 = ActivityModel(activityName: "Second Item", description: "Second Description", date: "June 20, 2023", time: "10:00 PM", isComplete: true, isCategory: "Project")
    
    
    static var previews: some View {
        Group {
            ActivityListCard(activity: activity1)
            ActivityListCard(activity: activity2)
        }
        .previewLayout(.sizeThatFits)
    }
}
