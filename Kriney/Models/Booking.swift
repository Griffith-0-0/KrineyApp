//
//  Booking.swift
//  Kriney
//
//  Created by user on 20/12/2025.
//

import Foundation

struct Booking: Identifiable, Codable {
    let id: String
    var userId: String
    var carId: String
    var startDate: Date
    var endDate: Date
    var totalPrice: Double
    var status: BookingStatus
    let createdAt: Date
    var updatedAt: Date

    enum BookingStatus: String, Codable {
        case pending   = "Pending"
        case confirmed = "Confirmed"
        case cancelled = "Cancelled"
        case completed = "Completed"

        var displayName: String { rawValue }
    }
}
