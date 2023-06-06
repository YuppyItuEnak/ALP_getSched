//
//  LoginViewModel.swift
//  ALP_getSchedMac
//
//  Created by MacBook Pro on 06/06/23.
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
        print("salahhhh")
    }
    func validate() {
        
    }
    
}
