//
//  ContentView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()
        
        var body: some View {
            VStack {
                DatePicker("Select a date and time", selection: $selectedDate, displayedComponents: [.hourAndMinute, .date])
                Text("Selected date: \(dateFormatter.string(from: selectedDate))")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
