//
//  User.swift
//  Kriney
//
//  Created by user on 19/12/2025.
//

// User.swift
import Foundation

struct User: Identifiable, Codable {
    let id: String
    var email: String
    var displayName: String
    var phoneNumber: String?
    var photoURL: String?
    var role: UserRole  
    var driverLicenseNumber: String?
    var driverLicenseExpiry: Date?
    var isVerified: Bool
    let createdAt: Date
    var updatedAt: Date
    
    // Agency-specific fields (only used if role == .agency)
    var agencyName: String?
    var agencyAddress: String?
    var businessLicense: String?
    
    enum UserRole: String, Codable {
        case client = "client"
        case agency = "agency"
    }
}
