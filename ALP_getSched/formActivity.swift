//
//  formActivity.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct formActivity: View {
    
    @State var activityName: String = ""
    @State var description: String = ""
    @State var selectedDate: Date
    @State var selectedTime: Date
    @State var categoryPersonal: Bool = false
    @State var categoryProject: Bool = false
    
    var body: some View {
        NavigationStack{
            GroupBox{
                Form{
                    Section(header: Text("Form Activity")){
                        TextField("Activity Name ", text: $activityName)
                        
                        TextField("Description", text: $description)
                        
                        DatePicker("Date", selection: $selectedDate,  displayedComponents: .date)
                        
                        DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        
                        Toggle("Personal", isOn: $categoryPersonal)
                        Toggle("Project", isOn: $categoryProject)
                    }
                    Section{
                        Button(action: {}) {
                                Text("Submit")
                                    .frame(maxWidth: .infinity)
                            }
                    }
                }.frame(alignment: .center)
            }
        }.navigationTitle("Form Activity")
    }
}

struct formActivity_Previews: PreviewProvider {
    static var previews: some View {
        formActivity(selectedDate: Date(), selectedTime: Date())
    }
}
