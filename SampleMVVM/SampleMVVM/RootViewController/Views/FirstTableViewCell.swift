//
//  FirstTableViewCell.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 IBM. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var cellViewModel: FirstTableViewCellConfigurables! {
        didSet {
            self.leftLabel.text = cellViewModel.leftLabel
            self.rightLabel.text = cellViewModel.rightLabel
            if cellViewModel.accessory == true {
                self.accessoryType = .disclosureIndicator
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    class func reuseID() -> String {
        return String(describing: self)
    }
}
