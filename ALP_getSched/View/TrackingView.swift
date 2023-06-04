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
    @State private var selectedActivities: [ActivityModel] = []
    @State var selectedDate = Date()

    
    private let calendar = Calendar.current
    private var currentDate = Date()
    private let currentYear = Calendar.current.component(.year, from: Date())
    private let currentDay = Calendar.current.component(.day, from: Date())
      
    
    
    var body: some View {
        let activityCounts = aggregateActivityCounts()
    
        ScrollView{
            VStack {
                //Calendar

                VStack {
                                                    Text("Calendar")
                                                        .font(.title)
                                                        .padding()
                                                    ZStack {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .foregroundColor(.white)
                                                            .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                                                        
                                                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                                            .padding(.horizontal)
                                                            .datePickerStyle(.graphical)
                                                            .background(
                                                                
                                                            )
                                                        
                                                        
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
                                                                            if activity.isCategoryProject == true && activity.isCategoryPersonal == false{
                                                                                Text("Project")
                                                                                    .font(.caption)
                                                                                    .foregroundColor(.secondary)
                                                                            }
                                                                            if activity.isCategoryPersonal == true && activity.isCategoryProject == false{
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
    
 
    

    

    private var monthFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"
            return formatter
        }
    
    private var yearFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            return formatter
        }
        private var daysOfWeek: [String] {
            calendar.shortWeekdaySymbols
        }
        
        private var daysInMonth: [Int] {
            let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))!
            let range = calendar.range(of: .day, in: .month, for: startOfMonth)!
            return Array(range.lowerBound..<range.upperBound)
        }
    
    
    
    
    //nge count activity per bulan dan menampilkan bulan dengan format MMMM
    func aggregateActivityCounts() -> [(String, Double)] {
            let currentDate = Date()
            let calendar = Calendar.current
            let year = calendar.component(.year, from: currentDate)
            
            // Create an array of tuples representing each month with an initial count of 0
            var activityCounts: [(String, Double)] = []
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM"
            for month in 1...12 {
                let monthName = dateFormatter.monthSymbols[month - 1]
                activityCounts.append((monthName, 0))
            }
            
            for activity in activityViewModel.activities {
                let activityDate = activity.date
                dateFormatter.dateFormat = "MMMM dd, yyyy"
                if let date = dateFormatter.date(from: activityDate) {
                    let activityYear = calendar.component(.year, from: date)
                    
                    if activityYear == year {
                        let month = calendar.component(.month, from: date)
                        let count = activityCounts.first(where: { $0.0 == dateFormatter.monthSymbols[month - 1] })?.1 ?? 0
                        if let index = activityCounts.firstIndex(where: { $0.0 == dateFormatter.monthSymbols[month - 1] }) {
                            activityCounts[index] = (dateFormatter.monthSymbols[month - 1], count + 1)
                        } else {
                            activityCounts.append((dateFormatter.monthSymbols[month - 1], count + 1))
                        }
                    }
                }
            }
            
            return activityCounts.sorted { dateFormatter.monthSymbols.firstIndex(of: $0.0)! < dateFormatter.monthSymbols.firstIndex(of: $1.0)! }
        }
        
   
}


struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
            .environmentObject(ActivityViewModel())
    }
}

