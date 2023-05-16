//
//  AddActivityView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 15/05/23.
//

import SwiftUI

struct AddActivityView: View {
    
    @State var activityName: String = ""
    @State var description: String = ""
    @State var dateTime = Date()
    @State var time = Date()
    @State var isCategoryPersonal: Bool = false
    @State var isCategoryProject: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                    Section(header: Text("Activity Form")){
                        //Textfield untuk Activity Name
                        TextField("Activity Name", text: $activityName)
                        //Textfield untuk description
                        TextField("Description", text: $description)
                        //Datepicker untuk user dapat memilih  tanggal yang diinginkan
                        DatePicker("Date: ", selection: $dateTime, displayedComponents: [.date])
                        //Datepicker untuk user dapat memilih waktu yang diinginkan
                        DatePicker("Time:", selection: $time, displayedComponents: [.hourAndMinute])
                        //Untuk set kategori apakah kategori ini personal atau project
                        Toggle("Personal", isOn: $isCategoryPersonal)
                        Toggle("Project", isOn: $isCategoryProject)
                    }
                
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
            .padding(.horizontal)
        }
    }

    
    
    // date dan time formatter
//    func getFormattedDateString() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .short
//        return dateFormatter.string(from: dateTime)
//    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddActivityView()
        }
    }
}
