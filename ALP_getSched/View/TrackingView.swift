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
    
    private let calendar = Calendar.current
    private let currentDate = Date()
    private let currentYear = Calendar.current.component(.year, from: Date())
    private let currentMonth = Calendar.current.component(.month, from: Date())
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
                                
                        VStack(spacing: 10) {
                            Text("\(calendar.component(.year, from: currentDate))")
                                .font(.title2)
                                    
                            HStack {
                                ForEach(calendar.shortWeekdaySymbols, id: \.self) { day in
                                    Text(day)
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity)
                                }
                            }
                                    
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                                ForEach(getDaysInMonth(), id: \.self) { day in
                                    Text("\(day)")
                                        .fontWeight(.bold)
                                        .frame(width: 30, height: 30)
                                        .background(day == currentDay ? Color.blue : Color.clear)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .padding()
                    }
                    .padding()
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
                    
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.orange)
                            .frame(width: 10, height: 10)
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
              
            }
        }
               
    }
    
    private func getDaysInMonth() -> [Int] {
        let currentYear = calendar.component(.year, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let startOfMonth = calendar.date(from: DateComponents(year: currentYear, month: currentMonth, day: 1))!
        let range = calendar.range(of: .day, in: .month, for: startOfMonth)!
        return Array(range.lowerBound..<range.upperBound)
    }
        
    private func createDate(year: Int, month: Int, day: Int) -> Date? {
        let dateComponents = DateComponents(year: year, month: month, day: day)
        return calendar.date(from: dateComponents)
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
        
        func xAxisLabels() -> [String] {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM"
            return dateFormatter.monthSymbols
        }
}


struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
            .environmentObject(ActivityViewModel())
    }
}
