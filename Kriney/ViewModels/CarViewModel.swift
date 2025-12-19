//
//  CarViewModel.swift
//  Kriney
//
//  Created by automated assistant on 19/12/2025.
//

import Foundation
import Combine

/// ViewModel that simulates fetching cars from a network API.
/// - It provides loading and error state and uses `Task.sleep` to simulate latency.
final class CarViewModel: ObservableObject {
    @Published private(set) var cars: [Car] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String? = nil

    enum FetchError: LocalizedError {
        case network

        var errorDescription: String? {
            switch self {
            case .network: return "Network error simulated"
            }
        }
    }

    /// Simulate fetching cars from API.
    /// - Parameters:
    ///   - delayNanoseconds: simulated network latency in nanoseconds (default 1s)
    ///   - shouldFail: if true, the request will fail with a simulated error
    func fetchCars(delayNanoseconds: UInt64 = 1_000_000_000, shouldFail: Bool = false) async {
        await MainActor.run {
            self.isLoading = true
            self.errorMessage = nil
        }

        do {
            try await Task.sleep(nanoseconds: delayNanoseconds)

            if shouldFail {
                throw FetchError.network
            }

            let result: [Car]

            #if DEBUG
            // Use debug-only mock data when available
            result = Car.tab
            #else
            // Fallback empty array in non-debug builds
            result = []
            #endif

            await MainActor.run {
                self.cars = result
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }

    /// Convenience helper for use from SwiftUI previews / views: fire-and-forget loader.
    func load(delayNanoseconds: UInt64 = 1_000_000_000, shouldFail: Bool = false) {
        Task {
            await fetchCars(delayNanoseconds: delayNanoseconds, shouldFail: shouldFail)
        }
    }

    /// Fetch a single car by id with optional delay and failure simulation.
    func fetchCar(byId id: String, delayNanoseconds: UInt64 = 500_000_000, shouldFail: Bool = false) async -> Car? {
        await MainActor.run { self.isLoading = true; self.errorMessage = nil }
        do {
            try await Task.sleep(nanoseconds: delayNanoseconds)
            if shouldFail { throw FetchError.network }

            let found: Car?
            #if DEBUG
            found = Car.tab.first { $0.id == id }
            #else
            found = nil
            #endif

            await MainActor.run { self.isLoading = false }
            return found
        } catch {
            await MainActor.run { self.errorMessage = error.localizedDescription; self.isLoading = false }
            return nil
        }
    }
}
