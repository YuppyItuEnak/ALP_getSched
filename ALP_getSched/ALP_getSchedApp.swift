//
//  ALP_getSchedApp.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

@main
struct ALP_getSchedApp: App {
    @StateObject private var activityViewModel = ActivityViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
               SplashScreen()
                    .environmentObject(activityViewModel)
            }
        }
    }
}
