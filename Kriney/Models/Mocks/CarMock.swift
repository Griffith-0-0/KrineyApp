//
//  Car+Mock.swift
//  Kriney
//
//  Created by automated assistant on 19/12/2025.
//

import Foundation

#if DEBUG
extension Car {
    static let sample = Car(
        id: "0",
        agencyId: "agency1",
        brand: "Toyota",
        model: "Corolla",
        year: 2021,
        pricePerDay: 39.99,
        category: .sedan,
        transmission: .automatic,
        fuelType: .petrol,
        seats: 5,
        imageURL: nil,
        features: ["Air Conditioning", "Bluetooth", "GPS"],
        isAvailable: true,
        createdAt: Date(),
        updatedAt: Date()
    )

    static let samples: [Car] = [
        Car(
            id: "1",
            agencyId: "agency1",
            brand: "Toyota",
            model: "Corolla",
            year: 2021,
            pricePerDay: 39.99,
            category: .sedan,
            transmission: .automatic,
            fuelType: .petrol,
            seats: 5,
            imageURL: nil,
            features: ["Air Conditioning", "Bluetooth", "GPS"],
            isAvailable: true,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "2",
            agencyId: "agency2",
            brand: "Tesla",
            model: "Model 3",
            year: 2023,
            pricePerDay: 129.0,
            category: .sedan,
            transmission: .automatic,
            fuelType: .electric,
            seats: 5,
            imageURL: "https://example.com/tesla.jpg",
            features: ["Autopilot", "Electric"],
            isAvailable: false,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "3",
            agencyId: "agency3",
            brand: "Ford",
            model: "Escape",
            year: 2019,
            pricePerDay: 59.5,
            category: .suv,
            transmission: .automatic,
            fuelType: .petrol,
            seats: 5,
            imageURL: nil,
            features: ["All Wheel Drive", "Heated Seats"],
            isAvailable: true,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "4",
            agencyId: "agency1",
            brand: "Volkswagen",
            model: "Golf",
            year: 2018,
            pricePerDay: 34.0,
            category: .hatchback,
            transmission: .manual,
            fuelType: .diesel,
            seats: 5,
            imageURL: nil,
            features: ["Cruise Control", "Bluetooth"],
            isAvailable: true,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "5",
            agencyId: "agency2",
            brand: "BMW",
            model: "Z4",
            year: 2022,
            pricePerDay: 159.0,
            category: .convertible,
            transmission: .automatic,
            fuelType: .petrol,
            seats: 2,
            imageURL: nil,
            features: ["Convertible", "Leather Seats"],
            isAvailable: false,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "6",
            agencyId: "agency3",
            brand: "Mercedes",
            model: "C-Class",
            year: 2020,
            pricePerDay: 99.0,
            category: .coupe,
            transmission: .automatic,
            fuelType: .petrol,
            seats: 4,
            imageURL: nil,
            features: ["Sunroof", "Premium Audio"],
            isAvailable: true,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "7",
            agencyId: "agency1",
            brand: "Renault",
            model: "Trafic",
            year: 2016,
            pricePerDay: 49.0,
            category: .van,
            transmission: .manual,
            fuelType: .diesel,
            seats: 2,
            imageURL: nil,
            features: ["Cargo Space"],
            isAvailable: true,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "8",
            agencyId: "agency3",
            brand: "Ford",
            model: "F-150",
            year: 2021,
            pricePerDay: 89.0,
            category: .truck,
            transmission: .automatic,
            fuelType: .petrol,
            seats: 5,
            imageURL: nil,
            features: ["Tow Package"],
            isAvailable: false,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "9",
            agencyId: "agency2",
            brand: "Hyundai",
            model: "Ioniq",
            year: 2024,
            pricePerDay: 69.0,
            category: .sedan,
            transmission: .automatic,
            fuelType: .hybrid,
            seats: 5,
            imageURL: nil,
            features: ["Hybrid", "Lane Assist"],
            isAvailable: true,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Car(
            id: "10",
            agencyId: "agency1",
            brand: "Mini",
            model: "Cooper",
            year: 2017,
            pricePerDay: 44.0,
            category: .hatchback,
            transmission: .manual,
            fuelType: .petrol,
            seats: 4,
            imageURL: nil,
            features: ["Compact", "Park Assist"],
            isAvailable: true,
            createdAt: Date(),
            updatedAt: Date()
        )
    ]

    // alias requested as a "tab" of 10 cars
    static let tab = samples
}
#endif
