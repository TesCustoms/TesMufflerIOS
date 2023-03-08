//
//  SettingsModelController.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/1/23.
//

import Foundation
import UIKit

class SettingsModelController {
    static let shared = SettingsModelController()
    private init() {}
    
    var domainModel = SettingsDomainModel()
    
    func setDomainData(with title: String, and photo: UIImage) {
        self.domainModel = SettingsDomainModel(title, photo)
    }
}
