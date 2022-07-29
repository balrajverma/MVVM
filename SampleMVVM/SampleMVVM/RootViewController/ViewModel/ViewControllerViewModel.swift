//
//  ViewControllerViewModel.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 . All rights reserved.
//


import Foundation
import CoreGraphics

class ViewControllerViewModel: ViewControllerConfigurrables{
    var country: [Country] = []
    var firstSectionData = ["Name", "Version"]
    var secondSectionData = ["Country Name", "Country Code", "CatalogueID"]
    typealias getAPICall = (_ result: Bool)->()
    var delegate: RegisterCell?

    func callAPI(completion: @escaping getAPICall) {
        delegate?.displayActivityController()
        guard let url = URL(string: "https://mobilefoundation-ru-server.eu-de.mybluemix.net/mfp/api/adapters/salesassist_mockserver_api/country_List/715837884") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse, options: [JSONSerialization.ReadingOptions.mutableLeaves]) as? [String: Any]
                let item = jsonResponse! ["data"] as? NSArray
                for (index,_) in (item?.enumerated())!  {
                    let finalVals = item![index] as! [String: Any]
                    self.country.append(Country.init(withJson: finalVals))
                }
                self.delegate?.reloadTable()
                self.delegate?.removeIndicato()
                print(self.country)
                completion(true)
            } catch let parsingError {
                print("Error", parsingError)
                completion(false)
                self.delegate?.removeIndicato()
                self.delegate?.showAPIAlert()
            }
        }
        task.resume()
    }
    
    func copyToDetails() -> [Country] {
        return self.country
    }
    
    
    func cellViewModel(at IndexPath: IndexPath) -> FirstTableViewCellConfigurables? {
        switch IndexPath.section {
        case 0:
            return FirstTableCellViewModel(leftLabel:firstSectionData[IndexPath.row] , rightLabel:"Test", accessory: false )
            case 1:
                if country.count > 0 {
                    if IndexPath.row == 0 {
                        return FirstTableCellViewModel(leftLabel:secondSectionData[IndexPath.row], rightLabel: country[IndexPath.row].country, accessory: true)
                    }
                    if IndexPath.row == 1 {
                        return FirstTableCellViewModel(leftLabel:secondSectionData[IndexPath.row], rightLabel: country[IndexPath.row].countryCD, accessory: true )
                    }
                    if IndexPath.row == 2 {
                        return FirstTableCellViewModel(leftLabel:secondSectionData[IndexPath.row], rightLabel: country[IndexPath.row].catalogueID, accessory: true )
                    }
                } else {
                    return FirstTableCellViewModel(leftLabel:secondSectionData[IndexPath.row], rightLabel: "", accessory: true )
                }
        default:
            break
        }
        return FirstTableCellViewModel(leftLabel:"" , rightLabel: "", accessory: false)
    }
    
    func numberOfSection() -> Int {
        return 2
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        if section == 0 {return 2} else {return 3}
    }
    
    func heightForRow(at IndexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
