//
//  AddActivityView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import SwiftUI
import UserNotifications

//class notifUhuy{
//    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//        if granted {
//            // Authorization granted, you can schedule the notification
//            scheduleNotification()
//        } else {
//            // Authorization denied
//        }
//    }
//
//    func scheduleNotification() {
//        // Create a notification content
//        let content = UNMutableNotificationContent()
//        content.title = "Notification Title"
//        content.body = "This is the body of the notification."
//        content.sound = UNNotificationSound.default
//
//        // Create a trigger for the notification (e.g., schedule it after 5 seconds)
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//        // Create a unique identifier for the notification
//        let identifier = "NotificationIdentifier"
//
//        // Create a notification request
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//
//        // Schedule the notification
//        UserNotifications.UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Error scheduling notification: \(error.localizedDescription)")
//            } else {
//                print("Notification scheduled successfully.")
//            }
//        }
//    }
//}

class NotificationManager {
    static let instance = NotificationManager()
    
    // For Authorization
    func requestAuthorization(){
        let option : UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: option) { success, error in
            if success {
                print("SUCCESS")
                //                self.scheduleNotification(activityName: activityName, inputDate: inputDate, inputTime: inputTime)
            } else if let error = error {
                print("ERROR: \(error)")
            }
        }
    }
    
    // function untuk memformat waktu
    func timeFormat(time: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        let timeString = dateFormatter.string(from: time)
        
        return timeString
    }
    
    // function untuk memformat tanggal
    func dateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    func scheduleNotification(activityName: String, inputDate: Date, inputTime: Date){
        
        let userDate = dateFormat(date: inputDate)
        let userTime = timeFormat(time: inputTime)
        
        print("Pentol")
        print("Tanggal: \(userDate), Waktu: \(userTime)")
        
        // Create a Date object from the user-inputted date and time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm a" // Adjust the format according to your input
        dateFormatter.locale = Locale(identifier: "id_ID")
//        dateFormatter.timeZone = TimeZone(identifier: "Asia/Bangkok")
        let date = dateFormatter.date(from: "\(userDate) \(userTime)")
        
        if let selectedDate = date {
            let content = UNMutableNotificationContent()
            content.title = "REMINDER"
            content.subtitle = activityName
            content.sound = .default
            
            print("tau gaksih: \(selectedDate)")
            let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: selectedDate), repeats: false)
            
            let identifier = "NotificationIdentifier"
            
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully.")
                }
            }
        } else {
            print("Invalid date or time format.")
        }
    }
}


struct AddActivityView: View {
    @EnvironmentObject var activityViewModel: ActivityViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var activityName: String = ""
    @State var description: String = ""
    @State var dateTime = Date()
    @State var time = Date()
    @State var isComplete: Bool = false
    @State var isCategoryPersonal: Bool = true
    @State var isCategoryProject: Bool = false
    @State private var isValid: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                Section(header: Text("Activity Form")){
                    //Textfield untuk Activity Name
                    TextField("Activity Name", text: $activityName)
                        .padding(.top)
                        .padding(.bottom)
                    //Textfield untuk description
                    TextField("Description", text: $description)
                        .padding(.bottom)
                    //Datepicker untuk user dapat memilih  tanggal yang diinginkan
                    DatePicker("Date: ", selection: $dateTime, displayedComponents: [.date])
                        .padding(.bottom)
                    //Datepicker untuk user dapat memilih waktu yang diinginkan
                    DatePicker("Time:", selection: $time, displayedComponents: [.hourAndMinute])
                        .padding(.bottom)
                    //Untuk set kategori apakah kategori ini personal atau project
                    Toggle("Personal", isOn: $isCategoryPersonal)
                        .padding(.bottom)
                    Toggle("Project", isOn: $isCategoryProject)
                        .padding(.bottom)
                }
                
                if activityName != "" {
                    Button("Save".uppercased()){
                        NotificationManager.instance.requestAuthorization()
                        activityViewModel.addItem(activityName: activityName, description: description, date: dateTime, time: time, isComplete: isComplete, isCategoryProject: isCategoryProject, isCategoryPersonal: isCategoryPersonal)
                        NotificationManager.instance.scheduleNotification(activityName: activityName, inputDate: dateTime, inputTime: time)
                        isValid = true
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .alert(isPresented: $isValid){
                        Alert(title:  Text("Activity Saved"))
                    }
                } else {
                    Button(action: {
                        if activityName == "" {
                            isValid = true
                        }
                    }, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 44)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
                    .alert(isPresented: $isValid){
                        Alert(title:  Text("Title is empty"))
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddActivityView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

