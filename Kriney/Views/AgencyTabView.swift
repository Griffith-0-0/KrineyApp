// Views/AgencyTabView.swift
import SwiftUI

struct AgencyTabView: View {
    var body: some View {
        TabView {
            // My Cars - Manage inventory
            Text("My Cars")
                .tabItem {
                    Label("My Cars", systemImage: "car.2.fill")
                }
            
            // Received Bookings
            Text("Bookings")
                .tabItem {
                    Label("Bookings", systemImage: "calendar.badge.clock")
                }
            
            // Analytics/Stats
            Text("Analytics")
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar.fill")
                }
            
            // Profile
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    AgencyTabView()
}
