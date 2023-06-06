//
//  ActivityViewModel.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import Foundation
import UserNotifications
import WatchConnectivity

class ActivityViewModel: ObservableObject {

    // variable yang bisa digunakan di semua class dan menampung isi dari model
    @Published var activities: [ActivityModel] = []{
        didSet {
            saveItems()
        }
    }
    
    let activityKey: String = "activities_list"
    @Published var selectedDateActivities: [ActivityModel] = []
    
    init() {
        getActivities()
    }
    
    
    // function yang berisikan variable newItems sebagai dummydata untuk menyimpan activity
    func getActivities() {
        guard
            let data = UserDefaults.standard.data(forKey: activityKey),
            let saveActivities = try? JSONDecoder().decode([ActivityModel].self, from: data)
        else { return }
        
        self.activities = saveActivities
    }
    
    // function untuk mendelete activity berdasarkan index
    func deleteItem(indexSet: IndexSet) {
        activities.remove(atOffsets: indexSet)
    }
    
    // function untuk menambah activity
    func addItem(activityName: String, description: String, date: Date, time: Date, isComplete: Bool, isCategoryProject: Bool, isCategoryPersonal: Bool) {
        let forSavingDate = dateFormat(date: date)
        let forSavingTime = timeFormat(time: time)
        let newItem = ActivityModel(activityName: activityName, description: description, date: forSavingDate, time: forSavingTime, isComplete: isComplete, isCategoryProject: isCategoryProject, isCategoryPersonal: isCategoryPersonal)
        activities.append(newItem)
        
//        scheduleNotification(for: newItem)
        
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(activities){
            UserDefaults.standard.set(encodedData, forKey: activityKey)
            
            // Update data on Apple Watch
            let data = ["activities": activities]
            WCSession.default.sendMessage(data, replyHandler: nil, errorHandler: nil)
        }
    }
    
    // function untuk memformat tanggal
    func dateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    // function untuk memformat waktu
    func timeFormat(time: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        let timeString = dateFormatter.string(from: time)
        
        return timeString
    }
    
    // function untuk mengupdate selectedDateActivities berdasarkan tanggal yang dipilih
    func updateSelectedDateActivities(selectedDate: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let selectedDateString = dateFormatter.string(from: selectedDate)
        
        selectedDateActivities = activities.filter { $0.date == selectedDateString }
    }
}


