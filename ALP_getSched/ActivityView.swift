//
//  ActivityView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 09/05/23.
//

import SwiftUI

struct ActivityView: View {
    @Binding var activity: [ActivityModel]
    var body: some View {
        NavigationStack{
            List(activity){ activity in
                
            }
            .navigationTitle("Todo List 📝")
            .toolbar{
                NavigationLink("Add", destination: Text("Destination"))
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: .constant(ActivityModel.sampleActivity))
    }
}
