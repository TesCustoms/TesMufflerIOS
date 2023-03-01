//
//  VolumeSettingsViewModel.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/1/23.
//

import Foundation

class VolumeSettingsViewModel {
    
    var volumeSettingsModel = VolumeSettingsModel()
    
    func setUpSettingsModel(with title: String) {
        self.volumeSettingsModel = VolumeSettingsModel(title)
    }
}
