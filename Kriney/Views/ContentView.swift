// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                // Show appropriate interface based on role
                if authViewModel.isClient {
                    ClientTabView()
                } else if authViewModel.isAgency {
                    AgencyTabView()
                }
            } else {
                // Show login/signup flow
                NavigationStack {
                    LoginView()
                        .environmentObject(authViewModel)
                }
            }
        }
        .background(Color("background").ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
