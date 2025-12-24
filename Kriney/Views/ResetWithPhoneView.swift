//
//  ForgotPwView.swift
//  Kriney
//
//  Created by user on 21/12/2025.
//

import SwiftUI

struct RestWithPhoneView: View {
    @State private var phoneNumber: String = ""
    @State private var isLoading: Bool = false
    @State private var showOtpView = false
    @State private var navigateToLogin = false
    @FocusState private var isPhoneFocused: Bool
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
                    
                    Text("Enter the phone number associated with your account and we'll send you a code to reset your password.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(.top, 8)
                
                // Phone Input
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 0) {
                        Text("+212")
                            .foregroundColor(Color("textPrimary"))
                            .padding(.leading, 16)
                            .padding(.vertical, 16)
                        TextField("Phone number", text: $phoneNumber)
                            .keyboardType(.numberPad)
                            .textContentType(.telephoneNumber)
                            .padding(.leading, 8)
                            .padding(.vertical, 16)
                            .padding(.trailing, 16)
                            .focused($isPhoneFocused)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(
                                isPhoneFocused ? Color("primaryColor") : Color.gray.opacity(0.3),
                                lineWidth: isPhoneFocused ? 2 : 1
                            )
                    )
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
                
                // Switch to email reset Button
                Button(action: { dismiss() }) {
                    HStack {
                        Spacer()
                        Text("Reset using email")
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
                HStack{
                    Spacer()
                    Text("Return to")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Button(action: {
                        navigateToLogin = true
                    }) {
                        Text("Login in")
                            .font(.system(size: 16))
                            .foregroundColor(Color("primaryColor"))
                    }
                    Spacer()
                    }.padding(.top, 8)
                
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
        .navigationDestination(isPresented: $showOtpView) {
            OtpView(contactInfo: maskPhone(phoneNumber))
        }
        .navigationDestination(isPresented: $navigateToLogin) {
            LoginView()
        }
    }
    
    private func maskPhone(_ phone: String) -> String {
        guard phone.count >= 4 else { return "+212\(phone)" }
        
        let lastTwo = phone.suffix(2)
        let masked = String(repeating: "*", count: max(0, phone.count - 2))
        
        return "+212\(masked)\(lastTwo)"
    }
    
    private func handleContinue() {
        guard !phoneNumber.isEmpty else { return }
        
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
        RestWithPhoneView()
    }
}
