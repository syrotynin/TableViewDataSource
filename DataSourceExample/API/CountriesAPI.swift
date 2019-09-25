//
//  CountriesAPI.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/25/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import Foundation

protocol CountriesAPI {
	func getCountries(_ completion: @escaping ([Country]) -> ())
}
