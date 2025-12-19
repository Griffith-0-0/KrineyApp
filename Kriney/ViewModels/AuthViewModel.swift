// ViewModels/AuthViewModel.swift
import Foundation
import Combine

@MainActor
class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init() {
        checkAuthStatus()
    }
    
    // Check if user is already logged in
    func checkAuthStatus() {
        // For now, no auto-login
        // Later: Check Firebase Auth and restore session
        currentUser = nil
        isAuthenticated = false
    }
    
    // Login
    func login(email: String, password: String) async {
        isLoading = true
        errorMessage = nil
        
        // Simulate network delay
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Mock login - find user by email
        #if DEBUG
        if let user = User.mockUsers.first(where: { $0.email == email }) {
            currentUser = user
            isAuthenticated = true
        } else {
            errorMessage = "Invalid email or password"
        }
        #endif
        
        isLoading = false
    }
    
    // Sign up
    func signUp(email: String, password: String, displayName: String, role: User.UserRole, phoneNumber: String? = nil) async {
        isLoading = true
        errorMessage = nil
        
        // Validate email
        guard email.contains("@") else {
            errorMessage = "Invalid email format"
            isLoading = false
            return
        }
        
        // Validate password
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters"
            isLoading = false
            return
        }
        
        // Simulate network delay
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Create new user
        let newUser = User(
            id: UUID().uuidString,
            email: email,
            displayName: displayName,
            phoneNumber: phoneNumber,
            photoURL: nil,
            role: role,
            driverLicenseNumber: nil,
            driverLicenseExpiry: nil,
            isVerified: false,
            createdAt: Date(),
            updatedAt: Date(),
            agencyName: role == .agency ? displayName : nil,
            agencyAddress: nil,
            businessLicense: nil
        )
        
        currentUser = newUser
        isAuthenticated = true
        isLoading = false
    }
    
    // Logout
    func logout() {
        currentUser = nil
        isAuthenticated = false
        errorMessage = nil
    }
    
    // Update profile
    func updateProfile(displayName: String? = nil, phoneNumber: String? = nil, photoURL: String? = nil) {
        guard var user = currentUser else { return }
        
        if let displayName = displayName {
            user.displayName = displayName
        }
        if let phoneNumber = phoneNumber {
            user.phoneNumber = phoneNumber
        }
        if let photoURL = photoURL {
            user.photoURL = photoURL
        }
        
        user.updatedAt = Date()
        currentUser = user
    }
    
    // Helper: Check if current user is client
    var isClient: Bool {
        currentUser?.role == .client
    }
    
    // Helper: Check if current user is agency
    var isAgency: Bool {
        currentUser?.role == .agency
    }
}
