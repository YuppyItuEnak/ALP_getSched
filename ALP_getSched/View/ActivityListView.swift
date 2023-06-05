//
//  ActivityListView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import SwiftUI
import UserNotifications

struct ActivityListView: View {

    
    //Menampilkan list data activity
    @EnvironmentObject var activityViewModel: ActivityViewModel
    @State private var currentDate: Date = Date()
    
   
    var body: some View {
        
        NavigationView{
            ZStack{
                if activityViewModel.activities.isEmpty{
                    Text("There is no Activity")
                }else{
                    List{
                                           Section(header: Text("Activity for \(activityViewModel.dateFormat(date: currentDate))")){
                                               ForEach(activityViewModel.activities){ activity in
                                                   if activity.date == activityViewModel.dateFormat(date: currentDate) {
                                                           ActivityListCard(activity: activity)
                                                   }
                                               }
                                               .onDelete(perform: activityViewModel.deleteItem)
                                           }
                                           
                                           if let otherActivity = activityViewModel.activities.filter({$0.date != activityViewModel.dateFormat(date: currentDate)}) as [ActivityModel]?{
                                               if otherActivity.isEmpty{
                                                   Section(header: Text("Other Activity")){
                                                       Text("There are no activity")
                                                           .font(.callout)
                                                           .foregroundColor(.secondary)
                                                   }
                                               }else{
                                                   Section(header: Text("Other Activities")) {
                                                       ForEach(activityViewModel.activities){ activity in
                                                           ActivityListCard(activity: activity)
                                                       }
                                                       .onDelete(perform: activityViewModel.deleteItem)
                                                   }
                                               }
                                               
                                           }
                                       }
                                   
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("To Do List ")
            .toolbar{
                NavigationLink("Add", destination: AddActivityView())
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ActivityListView_Previews: PreviewProvider {
    static let activityViewModel = ActivityViewModel()
    static var previews: some View {
        ActivityListView()
            .environmentObject(activityViewModel)
    }
}
