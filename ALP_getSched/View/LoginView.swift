//
//  LoginView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
   
    var body: some View {
        NavigationView{
            VStack{
                //            Header
                HeaderView(title:"GET SCHED", subtitle: "Streamline Your Task", angle: 15, background: .blue)
                   
                
                
                //            Login Form
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button{
                        //                attemp login
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("log in")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                        

                    }
                    .padding()
                    Spacer()
                }
                //            Create account
                VStack{
                    Text("Never Use GetSched Before?")
                    NavigationLink("Create New Account",
                                   destination:RegisterView())
                    //                    show register
                    
                    
                }
                Spacer()
            }
            .padding(.bottom)
            
            
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
