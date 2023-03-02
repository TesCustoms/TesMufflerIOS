//
//  CarSelectionViewModel.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/1/23.
//

import Foundation
import UIKit

class CarSelectionViewModel {
    
    var dummyData = [
    "DODGE RAM TRX",
    "MERCEDES AMG G63",
    "BMW X6M",
    "PORSCHE PANAMERA",
    "AUDI RS7",
    "CORVETTE STINGRAY C7",
    "MERCEDES AMG S63"
    ]
    
    var carImages: [UIImage?] = [
        UIImage(named: "DodgeRamTRX"),
        UIImage(named: "MercedesG63"),
        UIImage(named: "BMWX6"),
        UIImage(named: "PorschePanamera"),
        UIImage(named: "AudiRS7"),
        UIImage(named: "c7vette"),
        UIImage(named: "MERCEDESS63")
    ]
}
