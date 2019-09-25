//
//  ReusableCell.swift
//  Telenor
//
//  Created by Serhii Syrotynin on 6/4/18.
//  Copyright © 2018 Greener Pastures. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base reusable protocol
protocol Reusable
{
	static var identifier: String { get }
	static var nib: UINib { get }
}

extension Reusable
{
	static var identifier: String {
		return String(describing: self)
	}

	static var nib: UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
}

// MARK: - Reusable protocols for specific containers
protocol ReusableTableCell: Reusable where Self: UITableViewCell {}
protocol ReusableCollectionCell: Reusable {}
protocol ReusableHeader: Reusable {}

extension ReusableTableCell
{
	static func registerNib(in tableView: UITableView)
	{
		tableView.register(nib, forCellReuseIdentifier: identifier)
	}

	static func register(in tableView: UITableView)
	{
		tableView.register(self, forCellReuseIdentifier: identifier)
	}
}

extension ReusableCollectionCell
{
	static func register(in collectionView: UICollectionView)
	{
		collectionView.register(nib, forCellWithReuseIdentifier: identifier)
	}
}

extension ReusableHeader
{
	static func register(in tableView: UITableView)
	{
		tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
	}
}
