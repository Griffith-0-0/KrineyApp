//
//  CarsView.swift
//  Kriney
//
//  Created by user on 23/12/2025.
//

import SwiftUI

// MARK: - Main View
struct CarsView: View {
    @StateObject private var brandViewModel = BrandViewModel()
    @StateObject private var carViewModel = CarViewModel()
    @State private var searchText: String = ""
    @State private var selectedBrand: String = "ALL"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    AppHeader()
                        .padding(.horizontal)
                    
                    SearchBarSection(searchText: $searchText)
                    
                    BrandFilterSection(
                        selectedBrand: $selectedBrand,
                        brands: ["ALL"] + brandViewModel.brands.map { $0.brandName }
                    )
                    
                    CarsContentSection()
                        .environmentObject(carViewModel)
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

// MARK: - Header Components
struct AppHeader: View {
    var body: some View {
        HStack {
            AppLogo()
            Spacer()
            NotificationButton()
            ProfileButton()
        }
    }
}

struct AppLogo: View {
    var body: some View {
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
        }
    }
}

struct NotificationButton: View {
    var body: some View {
        Button(action: {}) {
            ZStack(alignment: .topTrailing) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 44, height: 44)
                    .overlay(
                        Circle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                    .overlay(
                        Image(systemName: "bell")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(Color("textPrimary"))
                    )
                
                NotificationBadge(count: 2)
            }
        }
    }
}

struct NotificationBadge: View {
    let count: Int
    
    var body: some View {
        Circle()
            .fill(Color("primaryColor"))
            .frame(width: 18, height: 18)
            .overlay(
                Text("\(count)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
            )
            .offset(x: 3, y: -3)
    }
}

struct ProfileButton: View {
    var body: some View {
        Button(action: {}) {
            Circle()
                .fill(Color.white)
                .frame(width: 44, height: 44)
                .overlay(
                    Circle()
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                .overlay(
                    Image(systemName: "person")
                        .font(.system(size: 20))
                        .foregroundColor(Color("textPrimary"))
                )
        }
    }
}

// MARK: - Search Components
struct SearchBarSection: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 12) {
            SearchInput(searchText: $searchText)
            FilterButton()
        }
        .padding(.horizontal)
    }
}

struct SearchInput: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search your dream car.....", text: $searchText)
                .font(.system(size: 15))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("Stoke"), lineWidth: 1)
        )
    }
}

struct FilterButton: View {
    var body: some View {
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
}

// MARK: - Brand Filter Components
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
                    BrandLogo(logoName: logoName)
                    Text(brand)
                        .font(.system(size: 12, weight: .medium))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.white)
                } else {
                    AllBrandsIcon()
                }
            }
            .foregroundColor(isSelected ? .white : Color("textPrimary"))
            .padding(.horizontal, 8)
            .frame(width: brand == "ALL" ? 40 : 100, height: 60)
            .background(isSelected ? Color("primaryColor") : Color("textPrimary"))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: isSelected ? 0 : 1)
            )
        }
    }
}

struct BrandLogo: View {
    let logoName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
            Image(logoName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
    }
}

struct AllBrandsIcon: View {
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "arrow.triangle.2.circlepath")
                .font(.system(size: 20))
                .foregroundColor(.white)
            Text("ALL")
                .font(.system(size: 12, weight: .medium))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .foregroundColor(.white)
        }
    }
}

// MARK: - Content Container
struct CarsContentSection: View {
    @EnvironmentObject var carViewModel: CarViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            RecommendedCarsSection()
                .environmentObject(carViewModel)
            
            PopularCarsSection()
                .environmentObject(carViewModel)
            
            Spacer(minLength: 0)
        }
        .padding(.top, 20)
        .padding(.bottom, 20)
        .background(Color.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

// MARK: - Recommended Cars Section
struct RecommendedCarsSection: View {
    @EnvironmentObject var carViewModel: CarViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: "Recommend For You")
            
            if carViewModel.isLoading {
                LoadingView()
            } else if let error = carViewModel.errorMessage {
                ErrorView(message: error)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(carViewModel.cars.prefix(5)) { car in
                            VerticalCarCard(
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
            SectionHeader(title: "Our Popular Cars")
            
            if carViewModel.isLoading {
                LoadingView()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(carViewModel.cars.prefix(3)) { car in
                            HorizontalCarCard(
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

// MARK: - Section Components
struct SectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
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
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity)
            .padding()
    }
}

struct ErrorView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.red)
            .padding(.horizontal)
    }
}

// MARK: - View Extensions
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Preview
#Preview {
    CarsView()
}
