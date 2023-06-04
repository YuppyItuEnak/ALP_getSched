//
//  LocalNotification.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI
import UserNotifications

//class NotificationManager{
//    static let instance = NotificationManager()
//
//    func requestAuthorization(){
//        let option : UNAuthorizationOptions = [.alert, .sound, .badge]
//
//        UNUserNotificationCenter.current().requestAuthorization(options: option) { success, error in
//            if let error = error{
//                print("ERROR: \(error)")
//            }else{
//                print("SUCCESS")
//            }
//        }
//    }
//
//    func scheduleNotification(){
//        let content = UNMutableNotificationContent()
//        content.title = "REMINDER"
//        content.subtitle = "BUAT DANCOK"
//        content.sound = .default
//
//        var dateComponent = DateComponents()
//        dateComponent.day = 4
//        dateComponent.hour = 18
//        dateComponent.minute = 53
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
//
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request)
//    }
//}

struct LocalNotification: View {
    var body: some View {
        Text("oioi")
//        VStack {
//            Button("Request Authorization"){
//                NotificationManager.instance.requestAuthorization()
//            }
//
//            Button("Schedule Notification"){
//                NotificationManager.instance.scheduleNotification()
//            }
//        }
    }
}

struct LocalNotification_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotification()
    }
}
