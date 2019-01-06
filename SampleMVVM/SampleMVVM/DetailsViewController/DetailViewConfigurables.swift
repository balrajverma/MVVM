//
//  DetailViewConfigurables.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation
import CoreGraphics


/*Details contrroller configurables */

public protocol DetailsUICallbacks {
    //UIcall backs here
}

public protocol DetailConfigurables : AnyObject {
    var delegate: DetailsUICallbacks? {get set}
    func numberOfRows(inSection section: Int) -> Int
    func cellViewModel(at IndexPath: IndexPath)  -> DetailsCellConfigurables? // We will return the cell view model object here
}


/*Details contrroller configurables */  /*Details contrroller configurables */  /*Details contrroller configurables */
public protocol DetailsCellConfigurables: AnyObject {
    var leftLabel: String? {get}
    var accessory: Bool? {get}
}
