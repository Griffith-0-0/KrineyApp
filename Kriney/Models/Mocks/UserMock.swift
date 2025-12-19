//
//  User+Mock.swift
//  Kriney
//
//  Created by automated assistant on 19/12/2025.
//

// User+Mock.swift
import Foundation

#if DEBUG
extension User {
    static let mockUsers: [User] = {
        let clientCreated = Date(timeIntervalSince1970: 1700000000)
        let agencyCreated = Date(timeIntervalSince1970: 1700100000)

        let client = User(
            id: "user1",
            email: "client@example.com",
            displayName: "John Doe",
            phoneNumber: "+212 6 12 34 56 78",
            photoURL: nil,
            role: .client, 
            driverLicenseNumber: "CL-123456",
            driverLicenseExpiry: Date(timeIntervalSince1970: 1750000000),
            isVerified: true,
            createdAt: clientCreated,
            updatedAt: clientCreated,
            agencyName: nil,
            agencyAddress: nil,
            businessLicense: nil
        )

        let agency = User(
            id: "agency1",  // Changed to "agency1"
            email: "agency@example.com",
            displayName: "Premium Rentals",
            phoneNumber: "+212 6 87 65 43 21",
            photoURL: nil,
            role: .agency,
            driverLicenseNumber: nil,
            driverLicenseExpiry: nil,
            isVerified: true,
            createdAt: agencyCreated,
            updatedAt: agencyCreated,
            agencyName: "Premium Rentals",
            agencyAddress: "123 Main St, Casablanca",
            businessLicense: "BL-789012"
        )
        
        // Add more agencies for car ownership
        let agency2 = User(
            id: "agency2",
            email: "luxury@example.com",
            displayName: "Luxury Cars Morocco",
            phoneNumber: "+212 5 22 33 44 55",
            photoURL: nil,
            role: .agency,
            driverLicenseNumber: nil,
            driverLicenseExpiry: nil,
            isVerified: true,
            createdAt: agencyCreated,
            updatedAt: agencyCreated,
            agencyName: "Luxury Cars Morocco",
            agencyAddress: "456 Beach Rd, Marrakech",
            businessLicense: "BL-456789"
        )

        return [client, agency, agency2]
    }()

    static let mock: User = mockUsers[0]
    static let mockClient: User = mockUsers[0]
    static let mockAgency: User = mockUsers[1]
}
#endif
