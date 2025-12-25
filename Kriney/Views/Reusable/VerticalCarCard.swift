//
//  VerticalCarCard.swift
//  Kriney
//
//  Created by user on 25/12/2025.
//

import SwiftUI

struct VerticalCarCard: View {
    // Car data
    let car: Car
    let carName: String
    let rating: Double
    let location: String
    let price: String
    let imageName: String
    let fuelType: String
    let onFavoriteToggle: (String, Bool) -> Void
    
    // Flexible dimensions with default values
    var width: CGFloat = 250
    var imageHeight: CGFloat = 150
    var cornerRadius: CGFloat = 16
    var showLocation: Bool = true
    
    @State private var isWiggling = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Car Image with Favorite Button
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.gray.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: imageHeight)
                    .overlay(
                        Image(systemName: "car.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray.opacity(0.3))
                    )
                
                Button(action: {
                    onFavoriteToggle(car.id, !car.isFavorite)
                    
                    withAnimation(.easeInOut(duration: 0.1).repeatCount(3, autoreverses: true)) {
                        isWiggling = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isWiggling = false
                    }
                }) {
                    Image(systemName: car.isFavorite ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                        .foregroundColor(car.isFavorite ? .red : .gray)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .rotationEffect(.degrees(isWiggling ? 15 : 0))
                }
                .padding(12)
            }
            .padding(.horizontal, 4)
            .padding(.top, 4)
            
            // Car Details
            VStack(alignment: .leading, spacing: 6) {
                Text(carName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("textPrimary"))
                    .lineLimit(1)
                
                // Rating
                HStack(spacing: 4) {
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 14))
                        .foregroundColor(Color("textPrimary"))
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.orange)
                }
                
                // Location and Fuel
                HStack(spacing: 8) {
                    if showLocation {
                        HStack(spacing: 4) {
                            Image(systemName: "location.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                            Text(location)
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "fuelpump.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Text(fuelType)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                }
                
                // Price and Book Button
                HStack {
                    Text(price)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("textPrimary"))
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Book now")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color("textPrimary"))
                            .cornerRadius(20)
                    }
                }
            }
            .padding([.horizontal, .bottom], 12)
        }
        .frame(width: width)
        .background(Color.white)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.white, lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 4)
    }
}

// MARK: - Preview
#Preview {
    // Note: Replace this with your actual Car model initialization
    // This is just a placeholder preview
    let sampleCar = Car(
        id: "1",
        agencyId: "agency1",
        brand: "Mercedes-Benz",
        model: "C-Class",
        year: 2024,
        pricePerDay: 120,
        category: .sedan,
        transmission: .automatic,
        fuelType: .petrol,
        seats: 5,
        imageURL: nil,
        features: ["GPS", "AC"],
        isAvailable: true,
        isFavorite: false,
        createdAt: Date(),
        updatedAt: Date()
    )
    
    VerticalCarCard(
        car: sampleCar,
        carName: "Mercedes-Benz C-Class",
        rating: 4.8,
        location: "Available",
        price: "$120/Day",
        imageName: "car-placeholder",
        fuelType: "Petrol",
        onFavoriteToggle: { _, _ in }
    )
    .padding()
}
