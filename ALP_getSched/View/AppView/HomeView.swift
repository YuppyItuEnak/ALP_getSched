//
//  HomeView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

//Membuat extension color untuk mengganti warna 
extension Color {
    init(hex: UInt32) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}


//navigasi view
struct HomeView: View {
    @EnvironmentObject var viewModel: ActivityViewModel
    var body: some View {
        
        NavigationStack {
            TabView{
                ActivityListView()
                    .tabItem{
                        Label("Home", systemImage: "square.split.2x2")
                    }
                
                TrackingView()
                    .tabItem{
                        Label("Graph", systemImage: "chart.dots.scatter")
                        
                    }
                
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.2.badge.gearshape")
                    }
            }
//            .overlay(alignment: .topTrailing, content: {
//                NavigationLink(destination: AddActivityView()) {
//                    Image(systemName: "plus")
//                        .foregroundColor(.white)
//                        .fontWeight(.bold)
//                        .padding(.all,20)
//                        .foregroundColor(.blue)
//                        .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .leading, endPoint: .trailing))
//                        .cornerRadius(50)
//
//                }
//                .padding()
//            })
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        HomeView()
            .environmentObject(ActivityViewModel())
    }
}
