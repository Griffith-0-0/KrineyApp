//
//  ForgotPwView.swift
//  Kriney
//
//  Created by user on 21/12/2025.
//

import SwiftUI

struct ForgotPwView: View {
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                // App Logo and Name
                AppLogoName()
                
                Spacer().frame(height: 40)
                
                // Title
                Text("Reset your password")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Description
                Text("Enter the email address associated with your account and we'll send you a link to reset your password.")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .lineSpacing(4)
                
                Spacer().frame(height: 20)
                
                // Email Input
                VStack(alignment: .leading, spacing: 8) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 24)
                
                Spacer().frame(height: 20)
                
                // Continue Button
                Button(action: {
                    // Handle password reset
                }) {
                    HStack {
                        Spacer()
                        Text("Continue")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(30)
                }
                .padding(.horizontal, 24)
                
                // Return to login in
                HStack{
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
                    
                }.padding(.top, 8)
                
                
                Spacer()
                
                // Create a New account
                HStack {
                    Text("Create a")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignUpView()) {
                        Text("New account")
                            .font(.system(size: 16))
                            .foregroundColor(Color("primaryColor"))
                    }
                }
                .padding(.bottom, 32)
            }
            .padding(.top, 20)
        }
        .navigationBarHidden(true)
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
    ForgotPwView()
}
