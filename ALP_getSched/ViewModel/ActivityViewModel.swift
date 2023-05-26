//
//  ActivityViewModel.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import Foundation

class ActivityViewModel: ObservableObject {
    // variable yang bisa digunakan di semua class dan menampung isi dari model
    @Published var activities: [ActivityModel] = []
    
    
    init(){
        getActivities()
    }
    
    // function yang berisikan variable newItems sebagai dummydata untuk menyimpan activity
    func getActivities(){
        let newItems = [
            ActivityModel(activityName: "First Item", description: "first Description", date: "May 15, 2023", time: "12:00 AM", isComplete: false, isCategoryProject: true, isCategoryPersonal: false),
            ActivityModel(activityName: "Second Item", description: "Second Description", date: "June 20, 2023", time: "10:00 PM", isComplete: true, isCategoryProject: false, isCategoryPersonal: true),
            ActivityModel(activityName: "Third Item", description: "Third Description", date: "July 25, 2023", time: "01:00 PM", isComplete: false, isCategoryProject: true, isCategoryPersonal: false)
        ]
        activities.append(contentsOf: newItems)
    }
    
    // function untuk mendelete activity berdasarkan index
    func deleteItem(indexSet: IndexSet){
        activities.remove(atOffsets: indexSet)
    }
    
    // function untuk menambah activity
    func addItem(activityName: String, description: String, date: Date, time: Date, isComplete: Bool, isCategoryProject: Bool, isCategoryPersonal: Bool){
        let forSavingDate = dateFormat(date: date)
        let forSavingTime = timeFormat(time: time)
        let newItem = ActivityModel(activityName: activityName, description: description, date: forSavingDate, time: forSavingTime, isComplete: isComplete, isCategoryProject: isCategoryProject, isCategoryPersonal: isCategoryPersonal)
        activities.append(newItem)
    }
    
    // function untuk memformat tanggal
    func dateFormat(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dataString = dateFormatter.string(from: date)
        
        return dataString
    }
    
    //function untuk memformat waktu
    func timeFormat(time: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dataString = dateFormatter.string(from: time)
        
        return dataString
    }
}
