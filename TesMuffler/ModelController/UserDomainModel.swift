//
//  UserDomainModel.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 2/16/23.
//

import Foundation

struct UserDomainModel {
    var name: String?
    var email: String?
    var vin: String?
    
    init(_ signUpModel: SignUpModel? = nil) {
        self.name = signUpModel?.name
        self.email = signUpModel?.email
        self.vin = signUpModel?.vin
    }
}
