//
//  ActivityListView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import SwiftUI

struct ActivityListView: View {
    
    @EnvironmentObject var activityViewModel: ActivityViewModel
    var body: some View {
        TabView{
            NavigationStack {
                List{
                    ForEach(activityViewModel.activities){ activities in
                        ActivityListCard(activity: activities)
                    }
                }
                .navigationTitle("To Do List")
                .toolbar{
                    NavigationLink("Add", destination: AddActivityView())
                }
            }
        }
    }
}


struct ActivityListView_Previews: PreviewProvider {
    static let activityViewModel = ActivityViewModel()
    static var previews: some View {
        ActivityListView()
            .environmentObject(activityViewModel)
    }
}
