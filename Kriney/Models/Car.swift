//
//  Car.swift
//  Kriney
//
//  Created by user on 19/12/2025.
//

import Foundation

struct Car: Identifiable, Codable {
    let id: String
    let agencyId: String
    var brand: String
    var model: String
    var year: Int
    var pricePerDay: Double
    var category: CarCategory
    var transmission: TransmissionType
    var fuelType: FuelType
    var seats: Int
    var imageURL: String?
    var features: [String]
    var isAvailable: Bool
    var isFavorite: Bool = false
    let createdAt: Date
    var updatedAt: Date

    enum CarCategory: String, Codable {
        case sedan = "Sedan"
        case suv = "SUV"
        case hatchback = "Hatchback"
        case coupe = "Coupe"
        case convertible = "Convertible"
        case van = "Van"
        case truck = "Truck"
        case other = "Other"

        var displayName: String { rawValue }
    }

    enum TransmissionType: String, Codable {
        case manual = "Manual"
        case automatic = "Automatic"
        case semiAutomatic = "Semi-Automatic"
        case other = "Other"

        var displayName: String { rawValue }
    }

    enum FuelType: String, Codable {
        case petrol = "Petrol"
        case diesel = "Diesel"
        case electric = "Electric"
        case hybrid = "Hybrid"
        case other = "Other"

        var displayName: String { rawValue }
    }
}
