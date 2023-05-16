//
//  ActivityModel.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation

struct ActivityModel: Identifiable{
    let id: String
    var activityName: String
    var description: String
    var date: String
    var time: String
    var isComplete: Bool
    var isCategoryProject: Bool
    var isCategoryPersonal: Bool
    
    
    init(id: String = UUID().uuidString, activityName: String, description: String, date: String, time: String, isComplete: Bool, isCategoryProject: Bool, isCategoryPersonal: Bool) {
        self.id = id
        self.activityName = activityName
        self.description = description
        self.date = date
        self.time = time
        self.isComplete = isComplete
        self.isCategoryProject = isCategoryProject
        self.isCategoryPersonal = isCategoryPersonal
    }
}

