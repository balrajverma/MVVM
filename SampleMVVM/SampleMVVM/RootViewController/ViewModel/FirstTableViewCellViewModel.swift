//
//  FirstTableViewCellViewModel.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class FirstTableCellViewModel: FirstTableViewCellConfigurables {
    var leftLabel: String?
    var rightLabel: String?
    var accessory: Bool?
    
    init(leftLabel: String? , rightLabel: String?, accessory: Bool?) {
        self.leftLabel = leftLabel
        self.rightLabel = rightLabel
        self.accessory = accessory
    }
}
