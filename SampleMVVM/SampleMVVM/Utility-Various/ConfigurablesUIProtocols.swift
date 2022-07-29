//
//  ConfigurablesUIProtocols.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import CoreGraphics

/* ViewController Functions */
public protocol RegisterCell {
    // Use this protocol for any callback triggering for Viewmodel to Controller - > Here we are not working with Observer pattern and actually motivating towards POP using only class funcs .
    func registerCell ()
    func reloadTable()
    func displayActivityController()
    func removeIndicato()
    func showAPIAlert()
}

public protocol ViewControllerConfigurrables: AnyObject {
    var delegate: RegisterCell? {get set}
    func numberOfSection() -> Int
    func callAPI(completion: @escaping(_ result: Bool)->())
    func numberOfRows(inSection section: Int) -> Int
    func cellViewModel(at IndexPath: IndexPath) -> FirstTableViewCellConfigurables? // We will return the cell view model object here
    func heightForRow(at IndexPath: IndexPath) -> CGFloat
}

/* First tableCell configurables object via view model*/
public protocol FirstTableViewCellConfigurables: AnyObject {
    var leftLabel: String? {get}
    var rightLabel: String? {get}
    var accessory: Bool? {get}
    
}
