//
//  HomeView.swift
//  ALP_getSchedMac
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

extension NSColor {
    convenience init(hex: UInt32) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

struct HomeView: View {
    var body: some View {
        TabView {
            ActivityListView()
                .tabItem {
                    Label("Home", systemImage: "square.split.2x2")
                }
            
            TrackingView()
                .tabItem {
                    Label("Graph", systemImage: "chart.dots.scatter")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.2.badge.gearshape")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ActivityViewModel())
    }
}
