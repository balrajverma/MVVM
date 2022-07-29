//
//  Country.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

struct Country {
    var country: String?
    var countryCD: String?
    var catalogueID: String?
    
    init(withJson: [String:Any]) {
        self.country = withJson["countryName"] as? String
        self.countryCD = withJson["countryCd"] as? String
        self.catalogueID = withJson["catalogId"] as? String
    }
}
