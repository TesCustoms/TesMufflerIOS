//
//  UserModelController.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 2/16/23.
//

import Foundation

class UserModelController {
    
    static let shared = UserModelController()
    private init() {}
    
    var domainModel = UserDomainModel()
}
