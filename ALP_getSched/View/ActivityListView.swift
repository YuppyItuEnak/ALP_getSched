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
                        ForEach(activityViewModel.activities){ activity in
                            if activity.date != activityViewModel.dateFormat(date: currentDate) {
                                Section(header: Text("Activity Lainnya")){
                                    ActivityListCard(activity: activity)
                                }
                            } else {
                                Section(header: Text("Activities untuk \(activity.date)")) {
                                    ActivityListCard(activity: activity)
                                }
                            }
                        }
                        .onDelete(perform: activityViewModel.deleteItem)
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
