//
//  Brand.swift
//  Kriney
//
//  Created by user on 19/12/2025.
//

import Foundation

struct Brand: Identifiable, Codable {
    let id: String
    var brandName: String
    var imageName: String  // For asset catalog or URL
    var carIds: [String]

    // Computed property to get actual cars
    var cars: [Car] {
        #if DEBUG
        return Car.tab.filter { carIds.contains($0.id) }
        #else
        return []
        #endif
    }
}
