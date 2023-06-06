//
//  ActivityViewModel.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import Foundation
import UserNotifications

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
    func addItem(activityName: String, description: String, date: Date, time: Date, isComplete: Bool, isCategory: String) {
        let forSavingDate = dateFormat(date: date)
        let forSavingTime = timeFormat(time: time)
        let newItem = ActivityModel(activityName: activityName, description: description, date: forSavingDate, time: forSavingTime, isComplete: isComplete, isCategory: isCategory)
        activities.append(newItem)
        
        scheduleNotification(for: newItem)
        
    }
    
    func updateItem(item: ActivityModel){
        if let index = activities.firstIndex(where: {$0.id == item.id}){
            activities[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(activities){
            UserDefaults.standard.set(encodedData, forKey: activityKey)
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

    private func scheduleNotification(for activity: ActivityModel) {
            let center = UNUserNotificationCenter.current()
            center.getNotificationSettings { settings in
                if settings.authorizationStatus == .authorized {
                    let content = UNMutableNotificationContent()
                    content.title = "Reminder"
                    content.body = "Activity: \(activity.activityName)"
                    content.sound = UNNotificationSound.default
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMM dd, yyyy hh:mm a"
                    let dateString = "\(activity.date) \(activity.time)"
                    if let triggerDate = dateFormatter.date(from: dateString) {
                        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate), repeats: false)
                        let request = UNNotificationRequest(identifier: activity.id, content: content, trigger: trigger)
                        
                        center.add(request) { error in
                            if let error = error {
                                print("Error scheduling notification for \(activity.activityName): \(error.localizedDescription)")
                            }
                        }
                    }
                }
            }
        }
    //nge count activity per bulan dan menampilkan bulan dengan format MMMM
    func aggregateActivityCounts() -> [(String, Double)] {
        let currentDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        
        // Create an array of tuples representing each month with an initial count of 0
        var activityCounts: [(String, Double)] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        for month in 1...12 {
            let monthName = dateFormatter.monthSymbols[month - 1]
            activityCounts.append((monthName, 0))
        }
        
        for activity in activities {
            let activityDate = activity.date
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            if let date = dateFormatter.date(from: activityDate) {
                let activityYear = calendar.component(.year, from: date)
                
                if activityYear == year {
                    let month = calendar.component(.month, from: date)
                    let count = activityCounts.first(where: { $0.0 == dateFormatter.monthSymbols[month - 1] })?.1 ?? 0
                    if let index = activityCounts.firstIndex(where: { $0.0 == dateFormatter.monthSymbols[month - 1] }) {
                        activityCounts[index] = (dateFormatter.monthSymbols[month - 1], count + 1)
                    } else {
                        activityCounts.append((dateFormatter.monthSymbols[month - 1], count + 1))
                    }
                }
            }
        }
        
        return activityCounts.sorted { dateFormatter.monthSymbols.firstIndex(of: $0.0)! < dateFormatter.monthSymbols.firstIndex(of: $1.0)! }
    }
    
   
}
