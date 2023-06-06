//
//  ContentView.swift
//  WatchActivity Watch App
//
//  Created by MacBook Pro on 05/06/23.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    var body: some View {
        ActivityListView()
            }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ActivityViewModel())
    }
}
