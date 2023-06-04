//
//  LoginViewModel.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    init(){
        
    }
    
    func login() {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            error = "Please Fill In The Form"
            
            return
        }
        print("salah suuu")
    }
    func validate() {
        
    }
    
}
