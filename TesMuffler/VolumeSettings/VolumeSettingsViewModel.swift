//
//  VolumeSettingsViewModel.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/1/23.
//

import Foundation
import UIKit

class VolumeSettingsViewModel {
    
    var volumeSettingsModel = VolumeSettingsModel()
    
    func setUpSettingsModel(with title: String, and photo: UIImage) {
        self.volumeSettingsModel = VolumeSettingsModel(title, photo)
    }
}
