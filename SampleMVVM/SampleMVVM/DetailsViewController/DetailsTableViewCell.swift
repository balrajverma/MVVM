//
//  DetailsTableViewCell.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    
    var cellViewModel: DetailsCellConfigurables! {
        didSet {
            self.leftLabel.text = cellViewModel.leftLabel
            if cellViewModel.accessory == true {
                self.accessoryType = .checkmark
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    class func reuseID() -> String {
        return String(describing: self)
    }
    
}
