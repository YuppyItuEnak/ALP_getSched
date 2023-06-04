//
//  RegisterView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
            VStack{
                //            Header
                
                HeaderView(title: "Register", subtitle: "Start Organizing Now", angle: 15, background: .blue)

                Form{
                    TextField("Full name", text: $name)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())


                }
                
        }
    }
}




struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

