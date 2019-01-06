//
//  DetailCellViewModel.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation

class DetailCellViewModel: DetailsCellConfigurables {
    var accessory: Bool?
    var leftLabel: String?
    
    init(leftLabel: String?, accessory: Bool?) {
        self.leftLabel = leftLabel
        self.accessory = accessory
    }
}
