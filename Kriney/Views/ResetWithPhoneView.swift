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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // App Logo and Name
                AppLogoName()
                
                Spacer().frame(height: 40)
                
                // Title
                Text("Reset your password")
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Description
                Text("Enter the phone number associated with your account and we'll send you a code to reset your password.")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineSpacing(4)
                
                Spacer().frame(height: 20)
                
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
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
                
                Spacer()
                
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
                
                // Return to login in
                
                    HStack{
                        Spacer()
                        Text("Return to")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Login in")
                                .font(.system(size: 16))
                                .foregroundColor(Color("primaryColor"))
                        }
                        Spacer()
                        
                    }.padding(.top, 8)
                
            
                
                
                Spacer()
                
                // Create a New account
                HStack {
                    Spacer()
                    Text("Create a")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Button(action: {
                        dismiss()
                    }) {
                        Text("New account")
                            .font(.system(size: 16))
                            .foregroundColor(Color("primaryColor"))
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }
                .padding(.bottom, 32)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
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
            OtpView()
        }
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
    
    struct AppLogoName: View {
        var body: some View {
            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 44, height: 44)
                    Image(systemName: "car.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                }
                
                Text("Kriney")
                    .font(.title2).bold()
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    RestWithPhoneView()
}
