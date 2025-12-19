//
//  UserViewModel.swift
//  Kriney
//
//  Created by automated assistant on 19/12/2025.
//

import Foundation
import Combine

// ViewModel with mock data inside
@MainActor
class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var currentUser: User? = nil
    @Published var isLoading = false

    init() {
        loadMockData()
    }

    func loadMockData() {
        isLoading = true
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            #if DEBUG
            self.users = User.mockUsers
            self.currentUser = User.mockUsers.first
            #else
            self.users = []
            self.currentUser = nil
            #endif
            self.isLoading = false
        }
    }

    // Later, replace with real API call
    func fetchUsersFromAPI() async {
        isLoading = true
        // self.users = await apiService.fetchUsers()
        isLoading = false
    }

    func fetchCurrentUserFromAPI() async {
        isLoading = true
        // self.currentUser = await apiService.fetchCurrentUser()
        isLoading = false
    }
}
