//
//  Brand+Mock.swift
//  Kriney
//
//  Created by automated assistant on 19/12/2025.
//

import Foundation

#if DEBUG
extension Brand {
    // Create brands that match the Car.tab mock data. Each brand's `carIds` links to cars in Car.tab
    static let mockData: [Brand] = [
        Brand(id: "1", brandName: "Toyota", imageName: "toyota", carIds: ["1"]),
        Brand(id: "2", brandName: "Tesla", imageName: "tesla", carIds: ["2"]),
        Brand(id: "3", brandName: "Ford", imageName: "ford", carIds: ["3", "8"]),
        Brand(id: "4", brandName: "Volkswagen", imageName: "volkswagen", carIds: ["4"]),
        Brand(id: "5", brandName: "BMW", imageName: "bmw", carIds: ["5"]),
        Brand(id: "6", brandName: "Mercedes", imageName: "mercedes", carIds: ["6"]),
        Brand(id: "7", brandName: "Renault", imageName: "renault", carIds: ["7"]),
        Brand(id: "8", brandName: "Hyundai", imageName: "hyundai", carIds: ["9"]),
        Brand(id: "9", brandName: "Mini", imageName: "mini", carIds: ["10"]),
        Brand(id: "10", brandName: "Other", imageName: "other", carIds: [])
    ]
}
#endif
