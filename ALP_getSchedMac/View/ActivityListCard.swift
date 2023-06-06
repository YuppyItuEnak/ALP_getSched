//
//  ActivityListCard.swift
//  ALP_getSchedMac
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

struct ActivityListCard: View {
    let activity: ActivityModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(activity.activityName)
                        .font(.title)
                    Spacer()
                    Image(systemName: activity.isComplete ? "checkmark.circle" : "circle")
                        .foregroundColor(activity.isComplete ? .green : .red)
                }
                HStack {
                    Text(activity.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    if activity.isCategoryProject && !activity.isCategoryPersonal {
                        Text("Project")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    if activity.isCategoryPersonal && !activity.isCategoryProject {
                        Text("Personal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                HStack {
                    Text(activity.date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(activity.time)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ActivityListCard_Previews: PreviewProvider {
    static var activity1 = ActivityModel(activityName: "First Item", description: "First Description", date: "May 15, 2023", time: "12:00 AM", isComplete: false, isCategoryProject: false, isCategoryPersonal: false)
    
    static var activity2 = ActivityModel(activityName: "Second Item", description: "Second Description", date: "June 20, 2023", time: "10:00 PM", isComplete: true, isCategoryProject: false, isCategoryPersonal: false)
    
    static var previews: some View {
        Group {
            ActivityListCard(activity: activity1)
            ActivityListCard(activity: activity2)
        }
        .previewLayout(.sizeThatFits)
    }
}
