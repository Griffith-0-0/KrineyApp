// Views/ClientTabView.swift
import SwiftUI

struct ClientTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Home - Browse Cars
            CarsView()
                .tabItem {
                    VStack {
                        Image(systemName: "car")
//                        Text("Cars")
                    }
                }
                .tag(0)
            
            // My Bookings
            Text("My Bookings")
                .tabItem {
                    VStack {
                        Image(systemName: "calendar")
//                        Text("Bookings")
                    }
                }
                .tag(1)
            
            // Messages
            Text("Messages")
                .tabItem {
                    VStack {
                        Image(systemName: "envelope")
//                        Text("Messages")
                    }
                }
                .tag(2)
            
            // Notifications
            Text("Notifications")
                .tabItem {
                    VStack {
                        Image(systemName: "bell")
//                        Text("Notifications")
                    }
                }
                .tag(3)
            
            // Profile
            Text("Profile")
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
//                        Text("Profile")
                    }
                }
                .tag(4)
        }
        .tint(Color("primaryColor"))

    }
}

#Preview {
    ClientTabView()
}
