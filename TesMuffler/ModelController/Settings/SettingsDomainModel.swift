//
//  SettingsDomainModel.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/1/23.
//

import Foundation
import UIKit

struct SettingsDomainModel {
    var title: String?
    var photo: UIImage?
    
    init(_ title: String? = nil, _ photo: UIImage? = nil) {
        self.title = title
        self.photo = photo
    }
}
