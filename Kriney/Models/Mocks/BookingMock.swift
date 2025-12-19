//
//  Booking+Mock.swift
//  Kriney
//
//  Created by automated assistant on 20/12/2025.
//

import Foundation

#if DEBUG
extension Booking {
    static let mockData: [Booking] = {
        // Use deterministic dates
        let base = Date(timeIntervalSince1970: 1700000000) // ~Nov 14, 2023

        return [
            Booking(
                id: "b1",
                userId: "user1",
                carId: "1",
                startDate: base.addingTimeInterval(86400 * 2),
                endDate: base.addingTimeInterval(86400 * 5),
                totalPrice: 39.99 * 3,
                status: .confirmed,
                createdAt: base.addingTimeInterval(-86400 * 10),
                updatedAt: base.addingTimeInterval(-86400 * 9)
            ),
            Booking(
                id: "b2",
                userId: "user2",
                carId: "2",
                startDate: base.addingTimeInterval(86400 * 1),
                endDate: base.addingTimeInterval(86400 * 2),
                totalPrice: 129.0 * 1,
                status: .pending,
                createdAt: base.addingTimeInterval(-86400 * 5),
                updatedAt: base.addingTimeInterval(-86400 * 4)
            ),
            Booking(
                id: "b3",
                userId: "user1",
                carId: "3",
                startDate: base.addingTimeInterval(86400 * 10),
                endDate: base.addingTimeInterval(86400 * 15),
                totalPrice: 59.5 * 5,
                status: .cancelled,
                createdAt: base.addingTimeInterval(-86400 * 20),
                updatedAt: base.addingTimeInterval(-86400 * 19)
            ),
            Booking(
                id: "b4",
                userId: "user2",
                carId: "5",
                startDate: base.addingTimeInterval(86400 * 3),
                endDate: base.addingTimeInterval(86400 * 4),
                totalPrice: 159.0 * 1,
                status: .completed,
                createdAt: base.addingTimeInterval(-86400 * 30),
                updatedAt: base.addingTimeInterval(-86400 * 29)
            ),
            Booking(
                id: "b5",
                userId: "user1",
                carId: "9",
                startDate: base.addingTimeInterval(86400 * 7),
                endDate: base.addingTimeInterval(86400 * 9),
                totalPrice: 69.0 * 2,
                status: .confirmed,
                createdAt: base.addingTimeInterval(-86400 * 2),
                updatedAt: base.addingTimeInterval(-86400 * 1)
            )
        ]
    }()
}
#endif
