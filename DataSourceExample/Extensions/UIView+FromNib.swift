//
//  UIView+FromNib.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/27/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import UIKit

extension UIView
{
	static func fromNib<T: UIView>(with owner: Any? = nil) -> T
	{
		let nibName = String(describing: self).components(separatedBy: ".").last ?? ""
		guard let view = Bundle.main.loadNibNamed(nibName, owner: owner, options: nil)?.first as? T else
		{
			return T(frame: CGRect.zero)
		}
		return view
	}
}
