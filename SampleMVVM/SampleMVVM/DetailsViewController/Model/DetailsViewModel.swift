//
//  DetailsViewModel.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation

class DetailsControllerViewModel: DetailConfigurables {
    var delegate: DetailsUICallbacks?
    var country: [Country] = []
    

    
    func numberOfRows(inSection section: Int) -> Int {
        return country.count
    }
    
    func cellViewModel(at IndexPath: IndexPath) -> DetailsCellConfigurables? {
        return DetailCellViewModel.init(leftLabel: country[IndexPath.row].country , accessory: true)
    }
    
    func didSelectAtIndex(at Indexpath: IndexPath) {
        
    }
    
    
}
