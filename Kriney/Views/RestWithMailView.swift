//
//  RestWithMailView.swift
//  Kriney
//
//  Created by user on 21/12/2025.
//

import SwiftUI

struct RestWithMailView: View {
    @State private var email: String = ""
    @State private var isLoading: Bool = false
    @State private var showPhoneReset = false
    @State private var showOtpView = false
    @FocusState private var isEmailFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // App Logo and Name
                AppLogoName()
                
                // Title
                VStack(alignment: .leading, spacing: 6) {
                    Text("Reset your password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("textPrimary"))
                    
                    Text("Enter the email address associated with your account and we'll send you a link to reset your password.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(.top, 8)
                
                // Email Input
                VStack(alignment: .leading, spacing: 8) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(
                                    isEmailFocused ? Color("primaryColor") : Color.gray.opacity(0.3),
                                    lineWidth: isEmailFocused ? 2 : 1
                                )
                        )
                        .focused($isEmailFocused)
                }
                
                // Continue Button
                Button(action: { handleContinue() }) {
                    HStack {
                        Spacer()
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Continue")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color("textPrimary"))
                    .cornerRadius(30)
                }
                .disabled(isLoading)
                
                // Switch to phone reset Button
                Button(action: { showPhoneReset = true }) {
                    HStack {
                        Spacer()
                        Text("Reset using phone number")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("primaryColor"))
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("primaryColor"), lineWidth: 1)
                    )
                }
                
                // Return to login
                Button(action: { dismiss() }) {
                    HStack {
                        Spacer()
                        Text("Return to")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Text("Login")
                            .font(.system(size: 16))
                            .foregroundColor(Color("primaryColor"))
                        Spacer()
                    }
                }
                .padding(.top, 8)
                
                // Create a New account
                HStack {
                    Spacer()
                    Text("Create a")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignUpView()) {
                        Text("New account")
                            .font(.system(size: 16))
                            .foregroundColor(Color("primaryColor"))
                    }
                    Spacer()
                }
            }
            .padding(24)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(Color("textPrimary"))
                }
            }
        }
        .navigationDestination(isPresented: $showPhoneReset) {
            RestWithPhoneView()
        }
        .navigationDestination(isPresented: $showOtpView) {
            OtpView(contactInfo: maskEmail(email))
        }
    }
    
    private func maskEmail(_ email: String) -> String {
        guard email.contains("@") else { return email }
        let components = email.split(separator: "@")
        guard components.count == 2 else { return email }
        
        let username = String(components[0])
        let domain = String(components[1])
        
        let visibleCount = min(3, username.count)
        let visible = username.prefix(visibleCount)
        let masked = String(repeating: "*", count: max(0, username.count - visibleCount))
        
        return "\(visible)\(masked)@\(domain)"
    }
    
    private func handleContinue() {
        guard !email.isEmpty else { return }
        
        isLoading = true
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            showOtpView = true
        }
    }
}

#Preview {
    NavigationStack {
        RestWithMailView()
    }
}
