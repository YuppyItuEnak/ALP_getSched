//
//  RegisterViewMac.swift
//  ALP_getSchedMac
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

struct RegisterViewMac: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start Organizing Now", angle: 15, background: .blue)
            
            Form {
                TextField("Full name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .disableAutocorrection(true)
                
                TextField("Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .disableAutocorrection(true)
                
                Button(action: {
                    // Attempt registration
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        
                        Text("Create account")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    .padding()
                }
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterViewMac()
    }
}

