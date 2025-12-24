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
        brand: "Dacia",
        model: "Logan",
        year: 2023,
        pricePerDay: 25.0,
        category: .sedan,
        transmission: .manual,
        fuelType: .petrol,
        seats: 5,
        imageURL: nil,
        features: ["Air Conditioning", "Bluetooth"],
        isAvailable: true,
        createdAt: Date(),
        updatedAt: Date()
    )

    static let samples: [Car] = [
        // Dacia (5 cars)
        Car(id: "1", agencyId: "agency1", brand: "Dacia", model: "Logan", year: 2023, pricePerDay: 25.0, category: .sedan, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Air Conditioning", "Bluetooth"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "2", agencyId: "agency1", brand: "Dacia", model: "Sandero", year: 2022, pricePerDay: 23.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Air Conditioning"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "3", agencyId: "agency2", brand: "Dacia", model: "Duster", year: 2024, pricePerDay: 35.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["4WD", "Roof Rails"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "4", agencyId: "agency2", brand: "Dacia", model: "Jogger", year: 2023, pricePerDay: 32.0, category: .suv, transmission: .manual, fuelType: .petrol, seats: 7, imageURL: nil, features: ["7 Seats", "Roof Bars"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "5", agencyId: "agency3", brand: "Dacia", model: "Dokker", year: 2021, pricePerDay: 28.0, category: .van, transmission: .manual, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Cargo Space"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Renault (5 cars)
        Car(id: "6", agencyId: "agency1", brand: "Renault", model: "Clio", year: 2023, pricePerDay: 27.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Air Conditioning", "Bluetooth"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "7", agencyId: "agency1", brand: "Renault", model: "Express", year: 2024, pricePerDay: 26.0, category: .van, transmission: .manual, fuelType: .diesel, seats: 2, imageURL: nil, features: ["Cargo Space"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "8", agencyId: "agency2", brand: "Renault", model: "Megane", year: 2022, pricePerDay: 33.0, category: .sedan, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Cruise Control", "GPS"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "9", agencyId: "agency2", brand: "Renault", model: "Kangoo", year: 2021, pricePerDay: 30.0, category: .van, transmission: .manual, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Sliding Doors"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "10", agencyId: "agency3", brand: "Renault", model: "Arkana", year: 2024, pricePerDay: 45.0, category: .suv, transmission: .automatic, fuelType: .hybrid, seats: 5, imageURL: nil, features: ["Hybrid", "LED Lights"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Hyundai (5 cars)
        Car(id: "11", agencyId: "agency1", brand: "Hyundai", model: "i10", year: 2023, pricePerDay: 22.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Compact", "City Car"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "12", agencyId: "agency1", brand: "Hyundai", model: "Accent", year: 2022, pricePerDay: 26.0, category: .sedan, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Air Conditioning", "Bluetooth"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "13", agencyId: "agency2", brand: "Hyundai", model: "i20", year: 2024, pricePerDay: 28.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Touchscreen", "Apple CarPlay"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "14", agencyId: "agency3", brand: "Hyundai", model: "Tucson", year: 2023, pricePerDay: 50.0, category: .suv, transmission: .automatic, fuelType: .hybrid, seats: 5, imageURL: nil, features: ["Hybrid", "Panoramic Roof"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "15", agencyId: "agency3", brand: "Hyundai", model: "Santa Fe", year: 2024, pricePerDay: 65.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 7, imageURL: nil, features: ["7 Seats", "4WD"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Peugeot (5 cars)
        Car(id: "16", agencyId: "agency1", brand: "Peugeot", model: "208", year: 2023, pricePerDay: 29.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Digital Cockpit", "Air Conditioning"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "17", agencyId: "agency1", brand: "Peugeot", model: "2008", year: 2024, pricePerDay: 38.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Touchscreen", "Reversing Camera"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "18", agencyId: "agency2", brand: "Peugeot", model: "308", year: 2022, pricePerDay: 35.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Cruise Control", "GPS"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "19", agencyId: "agency2", brand: "Peugeot", model: "3008", year: 2023, pricePerDay: 48.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Panoramic Roof", "i-Cockpit"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "20", agencyId: "agency3", brand: "Peugeot", model: "206", year: 2019, pricePerDay: 20.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Budget Friendly"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Volkswagen (5 cars)
        Car(id: "21", agencyId: "agency1", brand: "Volkswagen", model: "Golf", year: 2023, pricePerDay: 40.0, category: .hatchback, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Digital Cockpit", "Adaptive Cruise"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "22", agencyId: "agency1", brand: "Volkswagen", model: "Tiguan", year: 2024, pricePerDay: 55.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["4Motion", "LED Headlights"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "23", agencyId: "agency2", brand: "Volkswagen", model: "T-Roc", year: 2023, pricePerDay: 47.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Sporty Design", "Touchscreen"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "24", agencyId: "agency2", brand: "Volkswagen", model: "Polo", year: 2022, pricePerDay: 31.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Compact", "Bluetooth"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "25", agencyId: "agency3", brand: "Volkswagen", model: "Passat", year: 2023, pricePerDay: 52.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Executive", "Leather Seats"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Opel (5 cars)
        Car(id: "26", agencyId: "agency1", brand: "Opel", model: "Corsa", year: 2023, pricePerDay: 26.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Air Conditioning", "Bluetooth"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "27", agencyId: "agency1", brand: "Opel", model: "Astra", year: 2024, pricePerDay: 34.0, category: .sedan, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Touchscreen", "Cruise Control"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "28", agencyId: "agency2", brand: "Opel", model: "Mokka", year: 2023, pricePerDay: 42.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["LED Lights", "Park Assist"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "29", agencyId: "agency2", brand: "Opel", model: "Crossland", year: 2022, pricePerDay: 37.0, category: .suv, transmission: .manual, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Elevated Seating"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "30", agencyId: "agency3", brand: "Opel", model: "Vivaro", year: 2021, pricePerDay: 45.0, category: .van, transmission: .manual, fuelType: .diesel, seats: 9, imageURL: nil, features: ["9 Seats", "Commercial"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Citroën (5 cars)
        Car(id: "31", agencyId: "agency1", brand: "Citroën", model: "C3", year: 2023, pricePerDay: 28.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Airbump", "Touchscreen"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "32", agencyId: "agency1", brand: "Citroën", model: "C3 Aircross", year: 2024, pricePerDay: 39.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Modular", "Grip Control"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "33", agencyId: "agency2", brand: "Citroën", model: "C4", year: 2023, pricePerDay: 36.0, category: .sedan, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Progressive Hydraulic Cushions"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "34", agencyId: "agency2", brand: "Citroën", model: "Berlingo", year: 2022, pricePerDay: 33.0, category: .van, transmission: .manual, fuelType: .diesel, seats: 7, imageURL: nil, features: ["7 Seats", "Sliding Doors"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "35", agencyId: "agency3", brand: "Citroën", model: "C5 Aircross", year: 2024, pricePerDay: 49.0, category: .suv, transmission: .automatic, fuelType: .hybrid, seats: 5, imageURL: nil, features: ["Hybrid", "Advanced Comfort"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Fiat (5 cars)
        Car(id: "36", agencyId: "agency1", brand: "Fiat", model: "500", year: 2023, pricePerDay: 24.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 4, imageURL: nil, features: ["City Car", "Compact", "Retro Style"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "37", agencyId: "agency1", brand: "Fiat", model: "Panda", year: 2022, pricePerDay: 21.0, category: .hatchback, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Budget Friendly", "Compact"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "38", agencyId: "agency2", brand: "Fiat", model: "Tipo", year: 2024, pricePerDay: 30.0, category: .sedan, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Spacious", "Touchscreen"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "39", agencyId: "agency3", brand: "Fiat", model: "500X", year: 2023, pricePerDay: 38.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Compact SUV", "Uconnect"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "40", agencyId: "agency3", brand: "Fiat", model: "Ducato", year: 2022, pricePerDay: 50.0, category: .van, transmission: .manual, fuelType: .diesel, seats: 9, imageURL: nil, features: ["9 Seats", "Commercial", "Large Cargo"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Toyota (5 cars)
        Car(id: "41", agencyId: "agency1", brand: "Toyota", model: "Yaris", year: 2023, pricePerDay: 30.0, category: .hatchback, transmission: .automatic, fuelType: .hybrid, seats: 5, imageURL: nil, features: ["Hybrid", "Safety Sense"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "42", agencyId: "agency1", brand: "Toyota", model: "Corolla", year: 2024, pricePerDay: 38.0, category: .sedan, transmission: .automatic, fuelType: .hybrid, seats: 5, imageURL: nil, features: ["Hybrid", "TSS 2.5"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "43", agencyId: "agency2", brand: "Toyota", model: "RAV4", year: 2023, pricePerDay: 58.0, category: .suv, transmission: .automatic, fuelType: .hybrid, seats: 5, imageURL: nil, features: ["4WD", "Hybrid"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "44", agencyId: "agency2", brand: "Toyota", model: "Hilux", year: 2024, pricePerDay: 68.0, category: .truck, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["4WD", "Towing Capacity"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "45", agencyId: "agency3", brand: "Toyota", model: "Yaris Cross", year: 2023, pricePerDay: 43.0, category: .suv, transmission: .automatic, fuelType: .hybrid, seats: 5, imageURL: nil, features: ["Hybrid", "Compact SUV"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Audi (5 cars)
        Car(id: "46", agencyId: "agency1", brand: "Audi", model: "A3", year: 2023, pricePerDay: 60.0, category: .sedan, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Virtual Cockpit", "MMI"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "47", agencyId: "agency1", brand: "Audi", model: "A4", year: 2024, pricePerDay: 75.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Quattro", "Matrix LED"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "48", agencyId: "agency2", brand: "Audi", model: "Q3", year: 2023, pricePerDay: 70.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Compact SUV", "Virtual Cockpit"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "49", agencyId: "agency2", brand: "Audi", model: "Q5", year: 2024, pricePerDay: 95.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Quattro", "Air Suspension"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "50", agencyId: "agency3", brand: "Audi", model: "A6", year: 2023, pricePerDay: 110.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Executive", "Mild Hybrid"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // BMW (5 cars)
        Car(id: "51", agencyId: "agency1", brand: "BMW", model: "Série 1", year: 2023, pricePerDay: 65.0, category: .hatchback, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["iDrive", "Sport Mode"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "52", agencyId: "agency1", brand: "BMW", model: "Série 3", year: 2024, pricePerDay: 85.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["xDrive", "Live Cockpit"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "53", agencyId: "agency2", brand: "BMW", model: "Série 5", year: 2023, pricePerDay: 120.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Executive", "Driving Assistant"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "54", agencyId: "agency2", brand: "BMW", model: "X1", year: 2024, pricePerDay: 78.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["xDrive", "Panoramic Roof"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "55", agencyId: "agency3", brand: "BMW", model: "X5", year: 2023, pricePerDay: 140.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 7, imageURL: nil, features: ["7 Seats", "xDrive", "Air Suspension"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Mercedes-Benz (5 cars)
        Car(id: "56", agencyId: "agency1", brand: "Mercedes-Benz", model: "Classe A", year: 2023, pricePerDay: 70.0, category: .hatchback, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["MBUX", "LED Lights"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "57", agencyId: "agency1", brand: "Mercedes-Benz", model: "Classe C", year: 2024, pricePerDay: 90.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["4MATIC", "Digital Cockpit"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "58", agencyId: "agency2", brand: "Mercedes-Benz", model: "Classe E", year: 2023, pricePerDay: 130.0, category: .sedan, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["Executive", "Air Suspension"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "59", agencyId: "agency2", brand: "Mercedes-Benz", model: "GLA", year: 2024, pricePerDay: 82.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Compact SUV", "MBUX"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "60", agencyId: "agency3", brand: "Mercedes-Benz", model: "GLC", year: 2023, pricePerDay: 105.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["4MATIC", "Panoramic Roof"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // Nissan (5 cars)
        Car(id: "61", agencyId: "agency1", brand: "Nissan", model: "Qashqai", year: 2023, pricePerDay: 42.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["ProPILOT", "Touchscreen"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "62", agencyId: "agency1", brand: "Nissan", model: "Juke", year: 2024, pricePerDay: 40.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Sporty Design", "LED Lights"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "63", agencyId: "agency2", brand: "Nissan", model: "X-Trail", year: 2023, pricePerDay: 54.0, category: .suv, transmission: .automatic, fuelType: .diesel, seats: 7, imageURL: nil, features: ["7 Seats", "4WD"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "64", agencyId: "agency2", brand: "Nissan", model: "Navara", year: 2024, pricePerDay: 62.0, category: .truck, transmission: .automatic, fuelType: .diesel, seats: 5, imageURL: nil, features: ["4WD", "Towing"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "65", agencyId: "agency3", brand: "Nissan", model: "Sunny", year: 2021, pricePerDay: 23.0, category: .sedan, transmission: .manual, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Budget Friendly"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        
        // MG (5 cars)
        Car(id: "66", agencyId: "agency1", brand: "MG", model: "ZS", year: 2023, pricePerDay: 35.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Touchscreen", "Reversing Camera"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "67", agencyId: "agency1", brand: "MG", model: "MG4", year: 2024, pricePerDay: 48.0, category: .hatchback, transmission: .automatic, fuelType: .electric, seats: 5, imageURL: nil, features: ["Electric", "Fast Charging"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "68", agencyId: "agency2", brand: "MG", model: "HS", year: 2023, pricePerDay: 44.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Panoramic Roof", "ADAS"], isAvailable: false, createdAt: Date(), updatedAt: Date()),
        Car(id: "69", agencyId: "agency2", brand: "MG", model: "RX5", year: 2022, pricePerDay: 38.0, category: .suv, transmission: .automatic, fuelType: .petrol, seats: 5, imageURL: nil, features: ["Spacious", "Touchscreen"], isAvailable: true, createdAt: Date(), updatedAt: Date()),
        Car(id: "70", agencyId: "agency3", brand: "MG", model: "Marvel R", year: 2024, pricePerDay: 65.0, category: .suv, transmission: .automatic, fuelType: .electric, seats: 5, imageURL: nil, features: ["Electric", "AWD", "Advanced Tech"], isAvailable: true, createdAt: Date(), updatedAt: Date())
    ]

    static let tab = samples
}
#endif
