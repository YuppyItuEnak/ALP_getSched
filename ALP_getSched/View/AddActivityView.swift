//
//  AddActivityView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import SwiftUI

struct AddActivityView: View {
    @EnvironmentObject var activityViewModel: ActivityViewModel
    
    @State var activityName: String = ""
    @State var description: String = ""
    @State var dateTime = Date()
    @State var time = Date()
    @State var isComplete: Bool = false
    @State var isCategoryPersonal: Bool = false
    @State var isCategoryProject: Bool = false
    
    
    var body: some View {
        ScrollView{
                VStack {
                    Section(header: Text("Activity Form")){
                        //Textfield untuk Activity Name
                        TextField("Activity Name", text: $activityName)
                            .padding(.top)
                            .padding(.bottom)
                        
                        
                        
                        //Textfield untuk description
                        TextField("Description", text: $description)
                            .padding(.bottom)
                        //Datepicker untuk user dapat memilih  tanggal yang diinginkan
                        DatePicker("Date: ", selection: $dateTime, displayedComponents: [.date])
                            .padding(.bottom)
                        //Datepicker untuk user dapat memilih waktu yang diinginkan
                        DatePicker("Time:", selection: $time, displayedComponents: [.hourAndMinute])
                            .padding(.bottom)
                        //Untuk set kategori apakah kategori ini personal atau project
                        Toggle("Personal", isOn: $isCategoryPersonal)
                            .padding(.bottom)
                        Toggle("Project", isOn: $isCategoryProject)
                            .padding(.bottom)
                    }
                    
                    
                    if activityName != "" && description != "" {
                        Button(action: {activityViewModel.addItem(activityName: activityName, description: description, date: dateTime, time: time, isComplete: isComplete, isCategoryProject: isCategoryProject, isCategoryPersonal: isCategoryPersonal)}, label: {
                            Text("Save".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 44)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        })
                        .onSubmit {
//                            ActivityListView()
                        }
                    } else {
                        Button(action: {}, label: {
                            Text("Save".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 44)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        })
                    }
                    
                }
                .padding(.horizontal)
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddActivityView()
        }
    }
}
