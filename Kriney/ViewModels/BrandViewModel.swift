//
//  BrandViewModel.swift
//  Kriney
//
//  Created by automated assistant on 19/12/2025.
//

import Foundation
import Combine

@MainActor
class BrandViewModel: ObservableObject {
    @Published var brands: [Brand] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    // Reference to CarViewModel to get cars for each brand
    private var carViewModel: CarViewModel?

    init(carViewModel: CarViewModel? = nil) {
        self.carViewModel = carViewModel
        loadMockData()
    }

    func loadMockData() {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            #if DEBUG
            self.brands = Brand.mockData
            #else
            self.brands = []
            #endif
            self.isLoading = false
        }
    }

    func refresh() {
        loadMockData()
    }

    // Get brand by ID
    func getBrand(by id: String) -> Brand? {
        return brands.first { $0.id == id }
    }

    // Get all cars for a specific brand
    func getCars(for brand: Brand) -> [Car] {
        guard let carViewModel = carViewModel else { return brand.cars }
        return carViewModel.cars.filter { brand.carIds.contains($0.id) }
    }

    // Get brand by brand name
    func getBrand(byName name: String) -> Brand? {
        return brands.first { $0.brandName.lowercased() == name.lowercased() }
    }

    // Get popular brands (brands with most cars)
    func getPopularBrands(limit: Int = 5) -> [Brand] {
        return brands
            .sorted { $0.carIds.count > $1.carIds.count }
            .prefix(limit)
            .map { $0 }
    }
}
