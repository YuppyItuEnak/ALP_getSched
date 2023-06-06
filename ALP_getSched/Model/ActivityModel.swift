//
//  ActivityModel.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation

struct ActivityModel: Identifiable, Codable{
    let id: String
    var activityName: String
    var description: String
    var date: String
    var time: String
    var isComplete: Bool
    var isCategory: String
    
    
    init(id: String = UUID().uuidString, activityName: String, description: String, date: String, time: String, isComplete: Bool, isCategory: String) {
        self.id = id
        self.activityName = activityName
        self.description = description
        self.date = date
        self.time = time
        self.isComplete = isComplete
        self.isCategory = isCategory
    }
    
    func updateCompletion() -> ActivityModel{
        return ActivityModel(id: id,activityName: activityName, description: description, date: date, time: time, isComplete: !isComplete, isCategory: isCategory)
    }
}

