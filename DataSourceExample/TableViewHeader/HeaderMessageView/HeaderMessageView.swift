//
//  HeaderMessageView.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/27/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

class HeaderMessageView: UIView {
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var messageLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Round corners
		contentView.layer.cornerRadius = 3
		contentView.clipsToBounds = true
	}

	func configure(with text: String)
	{
		messageLabel.text = text
	}
}
