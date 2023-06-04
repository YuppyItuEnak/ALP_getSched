//
//  AddActivityView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import SwiftUI
import UserNotifications

class NotificationManager{
    static let instance = NotificationManager()
    
    func requestAuthorization(){
        let option : UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: option) { success, error in
            if let error = error{
                print("ERROR: \(error)")
            }else{
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(activatyName: String, dateTime: Date){
        let content = UNMutableNotificationContent()
        content.title = "REMINDER"
        content.subtitle = activatyName
        content.sound = .default
        
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateTime), repeats: false)

        
        let request = UNNotificationRequest(identifier: "SUCCESS", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
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
                        NotificationManager.instance.scheduleNotification(activatyName: activityName, dateTime: dateTime)
                        activityViewModel.addItem(activityName: activityName, description: description, date: dateTime, time: time, isComplete: isComplete, isCategoryProject: isCategoryProject, isCategoryPersonal: isCategoryPersonal)
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
