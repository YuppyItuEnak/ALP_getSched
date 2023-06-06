//
//  ProfileModel.swift
//  ALP_getSchedMac
//
//  Created by MacBook Pro on 06/06/23.
//

import Foundation

struct ProfileModel: Identifiable{
    let id: String
    var userName: String
    var userPassword: String
    var userEmail: String
    
    init(id: String = UUID().uuidString, userName: String, userPassword: String, userEmail: String) {
        self.id = id
        self.userName = userName
        self.userPassword = userPassword
        self.userEmail = userEmail
    }
}
