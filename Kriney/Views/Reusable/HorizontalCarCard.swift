//
//  HorizontalCarCard.swift
//  Kriney
//
//  Created by user on 25/12/2025.
//

import SwiftUI

struct HorizontalCarCard: View {
    // Car data
    let carName: String
    let rating: Double
    let price: String
    let imageName: String
    let fuelType: String
    
    // Flexible dimensions with default values
    var width: CGFloat = 320
    var imageHeight: CGFloat = 120
    var imageWidth: CGFloat? = nil // nil means it will flex with layout
    var cornerRadius: CGFloat = 16
    var padding: CGFloat = 4
    var showRating: Bool = true
    var showFuelType: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            // Car Image
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
                .frame(width: imageWidth, height: imageHeight)
                .overlay(
                    Image(systemName: "car.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.gray.opacity(0.3))
                )
            
            // Car Info
            VStack(alignment: .leading, spacing: 6) {
                Text(carName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color("textPrimary"))
                    .lineLimit(2)
                
                if showRating {
                    HStack(spacing: 4) {
                        Text(String(format: "%.1f", rating))
                            .font(.system(size: 14))
                            .foregroundColor(Color("textPrimary"))
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.orange)
                    }
                }
                
                if showFuelType {
                    HStack(spacing: 4) {
                        Image(systemName: "fuelpump.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Text(fuelType)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
                
                Text(price)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("textPrimary"))
            }
            
            Spacer()
        }
        .frame(width: width)
        .padding(padding)
        .background(Color.white)
        .cornerRadius(cornerRadius)
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 4)
    }
}

// MARK: - Convenience Initializers
extension HorizontalCarCard {
    /// Creates a compact version of the card with smaller dimensions
    static func compact(
        carName: String,
        rating: Double,
        price: String,
        imageName: String,
        fuelType: String
    ) -> HorizontalCarCard {
        HorizontalCarCard(
            carName: carName,
            rating: rating,
            price: price,
            imageName: imageName,
            fuelType: fuelType,
            width: 280,
            imageHeight: 100,
            cornerRadius: 12
        )
    }
    
    /// Creates a large version of the card
    static func large(
        carName: String,
        rating: Double,
        price: String,
        imageName: String,
        fuelType: String
    ) -> HorizontalCarCard {
        HorizontalCarCard(
            carName: carName,
            rating: rating,
            price: price,
            imageName: imageName,
            fuelType: fuelType,
            width: 380,
            imageHeight: 140,
            cornerRadius: 18
        )
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 20) {
        // Default size
        HorizontalCarCard(
            carName: "Mercedes-Benz C-Class",
            rating: 4.8,
            price: "$120/Day",
            imageName: "car-placeholder",
            fuelType: "Petrol"
        )
        
        // Compact size
        HorizontalCarCard.compact(
            carName: "BMW 3 Series",
            rating: 4.7,
            price: "$110/Day",
            imageName: "car-placeholder",
            fuelType: "Diesel"
        )
        
        // Large size
        HorizontalCarCard.large(
            carName: "Audi A6",
            rating: 4.9,
            price: "$150/Day",
            imageName: "car-placeholder",
            fuelType: "Hybrid"
        )
    }
    .padding()
}
