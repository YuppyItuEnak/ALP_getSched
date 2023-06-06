//
//  LoginView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                VStack{
                    //            Header
                    HeaderView(title:"GET SCHED", subtitle: "Streamline Your Task", angle: 15, background: .cyan)
//                        .padding(.top,25)
                }
                .padding(.bottom)
                
                
                //            Login Form
                
                
                Form{
                    if !viewModel.error.isEmpty{
                        Text(viewModel.error)
                            .foregroundColor(Color.red)
                    }
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                            .padding(.top,7)
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                        
                    Spacer()
                    
                        .padding(.top,20)
                        Button{
                            viewModel.login()
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
                    
                }
                    
                    
                    //            Create account
                    VStack{
                        Text("Never Use GetSched Before?")
                        NavigationLink(
                            destination: RegisterView(),
                            label: {
                                Text("Create New Account")
                            }
                        )
                        .accentColor(.red)
                        //                    show register
                        
                    
                    }
                    
                }
            }
        }
    }



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
