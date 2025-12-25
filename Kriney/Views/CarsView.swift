//
//  CarsView.swift
//  Kriney
//
//  Created by user on 23/12/2025.
//

import SwiftUI

struct CarsView: View {
    @StateObject private var brandViewModel = BrandViewModel()
    @StateObject private var carViewModel = CarViewModel()
    @State private var searchText: String = ""
    @State private var selectedBrand: String = "ALL"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 44, height: 44)
                            Image(systemName: "car.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        Text("Kriney")
                            .font(.title2).bold()
                        Spacer()
                        
                        // Notification Button
                        Button(action: {}) {
                            ZStack(alignment: .topTrailing) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 44, height: 44)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                        )
                                    Image(systemName: "bell")
                                        .font(.system(size: 18, weight: .regular))
                                        .foregroundColor(Color("textPrimary"))
                                }
                                
                                // Badge
                                Circle()
                                    .fill(Color("primaryColor"))
                                    .frame(width: 18, height: 18)
                                    .overlay(
                                        Text("2")
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(.white)
                                    )
                                    .offset(x: 3, y: -3)
                            }
                        }
                        
                        // Profile Button
                        Button(action: {}) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 44, height: 44)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                    )
                                
                                Image(systemName: "person")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("textPrimary"))
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    // Search Bar
                    SearchBarSection(searchText: $searchText)
                    
                    // Brand Filter
                    BrandFilterSection(
                        selectedBrand: $selectedBrand,
                        brands: ["ALL"] + brandViewModel.brands.map { $0.brandName }
                    )
                    
                    // White container with rounded top corners
                    VStack(spacing: 20) {
                        // Recommend For You Section
                        RecommendedCarsSection()
                            .environmentObject(carViewModel)
                        
                        // Our Popular Cars Section
                        PopularCarsSection()
                            .environmentObject(carViewModel)
                    }
                    .padding(.top, 20)
                    .background(Color.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
                }
                .padding(.bottom, 20)
            }
            .background(Color("background"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await carViewModel.fetchCars()
                }
            }
        }
    }
}

// MARK: - Search Bar Section
struct SearchBarSection: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 12) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search your dream car.....", text: $searchText)
                    .font(.system(size: 15))
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 20))
                    .foregroundColor(Color("textPrimary"))
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("Stoke"), lineWidth: 1)
                    )
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Brand Filter Section
struct BrandFilterSection: View {
    @Binding var selectedBrand: String
    let brands: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(brands, id: \.self) { brand in
                    BrandFilterButton(
                        brand: brand,
                        isSelected: selectedBrand == brand,
                        action: { selectedBrand = brand }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}

struct BrandFilterButton: View {
    let brand: String
    let isSelected: Bool
    let action: () -> Void
    
    // Helper function to get correct logo name
    private var logoName: String {
        switch brand {
        case "Mercedes-Benz":
            return "mercedesLogo"
        case "Citroën":
            return "citroenLogo"
        default:
            return "\(brand.lowercased())Logo"
        }
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if brand != "ALL" {
                    // Use brand logo from assets
                    ZStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 40, height: 40)
                        Image(logoName)  // Changed this line
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                    }
                    Text(brand)
                        .font(.system(size: 12, weight: .medium))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.white )
                    
                } else {
                    VStack(spacing: 4) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        Text(brand)
                            .font(.system(size: 12, weight: .medium))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            .foregroundColor(.white)
                    }
                }
                
                
            }
            .foregroundColor(isSelected ? .white : Color("textPrimary"))
            .padding(.horizontal, 8)
            .frame(width: brand=="ALL" ? 40 : 100, height: 60)
            .background(isSelected ? Color("primaryColor") : Color("textPrimary"))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: isSelected ? 0 : 1)
            )
        }
    }
}

// MARK: - Recommended Cars Section
struct RecommendedCarsSection: View {
    @EnvironmentObject var carViewModel: CarViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Recommend For You")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("textPrimary"))
                
                Spacer()
                
                Button(action: {}) {
                    Text("View All")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            if carViewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding()
            } else if let error = carViewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding(.horizontal)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(carViewModel.cars.prefix(5)) { car in
                            CarCard(
                                car: car,
                                carName: "\(car.brand) \(car.model)",
                                rating: 5.0,
                                location: "Available",
                                price: "$\(String(format: "%.0f", car.pricePerDay))/Day",
                                imageName: car.imageURL ?? "car-placeholder",
                                fuelType: car.fuelType.rawValue.capitalized,
                                onFavoriteToggle: { carId, isFavorite in
                                    carViewModel.toggleFavorite(carId: carId, isFavorite: isFavorite)
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                }
            }
        }
    }
}

// MARK: - Popular Cars Section
struct PopularCarsSection: View {
    @EnvironmentObject var carViewModel: CarViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Our Popular Cars")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("textPrimary"))
                
                Spacer()
                
                Button(action: {}) {
                    Text("View All")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            if carViewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(carViewModel.cars.prefix(3)) { car in
                            PopularCarCard(
                                carName: "\(car.brand) \(car.model)",
                                rating: 4.8,
                                price: "$\(String(format: "%.0f", car.pricePerDay))/Day",
                                imageName: car.imageURL ?? "car-placeholder",
                                fuelType: car.fuelType.rawValue.capitalized
                            )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                }
            }
        }
    }
}

// MARK: - Car Card Component
struct CarCard: View {
    let car: Car
    let carName: String
    let rating: Double
    let location: String
    let price: String
    let imageName: String
    let fuelType: String
    let onFavoriteToggle: (String, Bool) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .topTrailing) {
                // Car Image Placeholder
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.1))
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .overlay(
                        Image(systemName: "car.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray.opacity(0.3))
                    )
                
                // Favorite Button
                Button(action: {
                    onFavoriteToggle(car.id, !car.isFavorite)
                }) {
                    Image(systemName: car.isFavorite ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                        .foregroundColor(car.isFavorite ? .red : .gray)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding(12)
            }
            .padding(.horizontal, 4)
            .padding(.top, 4)
            
            
            VStack(alignment: .leading, spacing: 6) {
                Text(carName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("textPrimary"))
                
                HStack(spacing: 4) {
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 14))
                        .foregroundColor(Color("textPrimary"))
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.orange)
                }
                
                HStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "location.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Text(location)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
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
        .frame(width: 250)
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white, lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 4)
        
    }
}

// MARK: - Popular Car Card Component
struct PopularCarCard: View {
    let carName: String
    let rating: Double
    let price: String
    let imageName: String
    let fuelType: String
    
    var body: some View {
        HStack{
            // Car Image Placeholder
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
                .frame(/*width: 230,*/ height: 120)
                .overlay(
                    Image(systemName: "car.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.gray.opacity(0.3))
                )
//                .padding(.vertical, 4)
//                .padding(.leading, 4)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(carName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color("textPrimary"))
                
                HStack(spacing: 4) {
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 14))
                        .foregroundColor(Color("textPrimary"))
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.orange)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "fuelpump.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text(fuelType)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
                
                Text(price)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("textPrimary"))
            }
//            .padding(.vertical, 12)
//            .padding(.horizontal, 8)
            
            Spacer()
        }
        .frame(width: 320, )
        .padding(4)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 4)
    }
}

// MARK: - View Extension for Custom Corner Radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    CarsView()
}
