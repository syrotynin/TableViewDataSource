//
//  CountriesAPIMock.swift
//  DataSourceExample
//
//  Created by Serhii Syrotynin on 9/25/19.
//  Copyright © 2019 Serhii Syrotynin. All rights reserved.
//

import Foundation

class CountriesAPIMock: CountriesAPI
{
	func getCountries(_ completion: @escaping ([Country]) -> ()) {
		completion(makeCountries())
	}

	private func makeCountries() -> [Country] {
		let ukraine = Country(name: "Ukraine", regions: [Region(name: "Center", type: .industrial), Region(name: "West", type: .agricultural)], cities: [City(name: "Dnipro", population: 1), City(name: "Kyiv", population: 3), City(name: "Kharkiv", population: 2)])
		let russia = Country(name: "Russia", regions: [Region(name: "Moscow region", type: .industrial), Region(name: "Center", type: .agricultural), Region(name: "East", type: .agricultural)], cities: [City(name: "Moscow", population: 6), City(name: "Saint-Petersburg", population: 3), City(name: "Sochi", population: 1)])
		let usa = Country(name: "USA", regions: [Region(name: "Texas", type: .agricultural), Region(name: "East coast", type: .industrial)], cities: [City(name: "New York", population: 10), City(name: "Washington", population: 6), City(name: "Oklahoma", population: 1)])

		return [ukraine, russia, usa]
	}
}
