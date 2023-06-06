//
//  ProfileViewModel.swift
//  ALP_getSchedMac
//
//  Created by MacBook Pro on 06/06/23.
//

import Foundation

class ProfielViewModel: ObservableObject {
    @Published var profile: [ProfileModel] = []
    
    func UserRegister(userName: String, userPassword: String, userEmail: String, selectedCondition: Bool, userId: Int) {
//        let newProfile = ProfileModel(userName: userName, userPassword: userPassword, userEmail: userEmail)
//        if selectedCondition = true {
//            profile.append(newProfile)
//        } else {
//
//        }
    }
    
    func UserLogin(userName: String, userPassword: String){
        
    }
}
