//
//  TrackingView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 23/05/23.
//

import SwiftUI
import SwiftUICharts



struct TrackingView: View {
    
    @EnvironmentObject var activityViewModel: ActivityViewModel
    
    @State private var currentMonth: Date = Date()
    @State var selectedDate = Date()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    private let calendar = Calendar.current
    private var currentDate = Date()
    private let currentYear = Calendar.current.component(.year, from: Date())
    private let currentDay = Calendar.current.component(.day, from: Date())
    
    var body: some View {
        let activityCounts = activityViewModel.aggregateActivityCounts()
        
        if horizontalSizeClass == .compact{
            NavigationStack {
                ScrollView{
                    VStack {
                        //Calendar
                        
                        VStack {
                            Text("Calendar")
                                .font(.title)
                                .padding()
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                    .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                
                                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                    .padding(.horizontal)
                                    .datePickerStyle(.graphical)
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            let dateString = activityViewModel.dateFormat(date: selectedDate)
                            
                            ForEach(activityViewModel.activities) { activity in
                                if dateString == activity.date{
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                        
                                        HStack {
                                            VStack {
                                                HStack {
                                                    Text(activity.activityName)
                                                        .font(.title)
                                                    Spacer()
                                                    Image(systemName: activity.isComplete ? "checkmark.circle": "circle")
                                                        .foregroundColor(activity.isComplete ? .green: .red)
                                                }
                                                HStack{
                                                    Text(activity.description)
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                    Spacer()
                                                    if activity.isCategory == "Project" {
                                                        Text("Project")
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                    }
                                                    if activity.isCategory == "Personal"{
                                                        Text("Personal")
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                    }
                                                }
                                                HStack{
                                                    Text(activity.date)
                                                        .font(.caption2)
                                                        .foregroundColor(.secondary)
                                                    Text(activity.time)
                                                        .font(.caption2)
                                                        .foregroundColor(.secondary)
                                                    Spacer()
                                                }
                                            }
                                        }
                                        .padding()
                                    }
                                    .padding()
                                }
                            }
                        }
                        .padding()
                        
                        
                        //Activity Grafik
                        Text("Activity Graph")
                            .font(.title)
                        Text("Activity For The Year")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        
                        if activityCounts.isEmpty {
                            Text("No Data")
                            
                        } else {
                            BarChartView(
                                data: ChartData(
                                    values: activityCounts),
                                title: "Activity Count",
                                legend: "Number of Activities",
                                form: ChartForm.extraLarge,
                                cornerImage: Image(systemName: "chart.bar.fill"),
                                valueSpecifier: "%.0f"
                            )
                            .padding()
                            .frame(maxWidth: .infinity)
                            
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.orange)
                                    .frame(width: 100, height: 10)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                
                                
                                Text("Grafik dari jumlah activity per bulan")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                            }
                            
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                    
                                    Text("January")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                .frame(width: 100, height: 10)
                                
                                Text("Nama Bulan dalan setahun")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                    
                                    Text("Activity Count")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                .frame(width: 100, height: 10)
                                
                                Text("Jumlah dari Activity per bulan")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                }
            }
        }else{
            
            NavigationStack {
                ScrollView{
                    VStack {
                        //Calendar
                        
                        
                        
                        Text("Activity Graph")
                            .font(.title)
                        Text("Activity For The Year")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        HStack{
                            //Activity Grafik
                            
                            
                            if activityCounts.isEmpty {
                                Text("No Data")
                                
                            } else {
                                BarChartView(
                                    data: ChartData(
                                        values: activityCounts),
                                    title: "Activity Count",
                                    legend: "Number of Activities",
                                    form: ChartForm.extraLarge,
                                    cornerImage: Image(systemName: "chart.bar.fill"),
                                    valueSpecifier: "%.0f"
                                )
                                .padding()
                                .frame(maxWidth: .infinity)
                                
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.orange)
                                        .frame(width: 100, height: 10)
                                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                                    
                                    
                                    Text("Grafik dari jumlah activity per bulan")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    
                                }
                                
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                        
                                        Text("January")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: 100, height: 10)
                                    
                                    Text("Nama Bulan dalan setahun")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                        
                                        Text("Activity Count")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: 100, height: 10)
                                    
                                    Text("Jumlah dari Activity per bulan")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                        
                        VStack {
                            Text("Calendar")
                                .font(.title)
                                .padding()
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                    .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                
                                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                    .padding(.horizontal)
                                    .datePickerStyle(.graphical)
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            let dateString = activityViewModel.dateFormat(date: selectedDate)
                            
                            ForEach(activityViewModel.activities) { activity in
                                if dateString == activity.date{
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                        
                                        HStack {
                                            VStack {
                                                HStack {
                                                    Text(activity.activityName)
                                                        .font(.title)
                                                    Spacer()
                                                    Image(systemName: activity.isComplete ? "checkmark.circle": "circle")
                                                        .foregroundColor(activity.isComplete ? .green: .red)
                                                }
                                                HStack{
                                                    Text(activity.description)
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                    Spacer()
                                                    if activity.isCategory == "Project"{
                                                        Text("Project")
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                    }
                                                    if activity.isCategory == "Personal"{
                                                        Text("Personal")
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                    }
                                                }
                                                HStack{
                                                    Text(activity.date)
                                                        .font(.caption2)
                                                        .foregroundColor(.secondary)
                                                    Text(activity.time)
                                                        .font(.caption2)
                                                        .foregroundColor(.secondary)
                                                    Spacer()
                                                }
                                            }
                                        }
                                        .padding()
                                    }
                                    .padding()
                                }
                            }
                        }
                        .padding()
                        
                        
                    }
                }
            }
        }
    }
}


struct TrackingView_Previews: PreviewProvider {
    static var activityViewModel = ActivityViewModel()
    static var previews: some View {
        TrackingView()
            .environmentObject(activityViewModel)
    }
}

