//
//  CityTableViewCell.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/25/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CityTableViewCell: ReusableTableCell {}
