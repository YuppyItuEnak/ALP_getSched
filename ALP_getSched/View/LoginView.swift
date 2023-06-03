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
               HeaderView()
                
                
    //            Login Form
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $email)
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
                }
    //            Create account
                VStack{
                    Text("Never Use GetSched Before?")
                    NavigationLink("Create New Account",
                                   destination: RegisterView())
                        //                    show register
                    }
                    
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
