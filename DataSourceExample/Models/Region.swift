//
//  Region.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/25/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import Foundation

struct Region {

	enum RegionType {
		case industrial
		case agricultural
	}

	let name: String
	let type: RegionType
}
