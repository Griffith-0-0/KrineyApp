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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                AppLogoName()
                
                Spacer().frame(height: 40)
                
                ResetPasswordHeader(
                    title: "Reset your password",
                    description: "Enter the email address associated with your account and we'll send you a link to reset your password."
                )
                
                Spacer().frame(height: 20)
                
                EmailInputField(email: $email)
                
                Spacer()
                
                ResetActionButtons(
                    isLoading: isLoading,
                    primaryButtonTitle: "Continue",
                    secondaryButtonTitle: "Reset using phone number",
                    onPrimaryAction: handleContinue,
                    onSecondaryAction: { showPhoneReset = true }
                )
                
                ReturnToLoginButton(onDismiss: { dismiss() })
                
                Spacer()
                
                CreateAccountPrompt()
            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton(onDismiss: { dismiss() })
            }
        }
        .navigationDestination(isPresented: $showPhoneReset) {
            RestWithPhoneView()
        }
    }
    
    private func handleContinue() {
        guard !email.isEmpty else { return }
        
        isLoading = true
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            // TODO: Handle actual password reset
            dismiss()
        }
    }
}

// MARK: - Subviews

private struct ResetPasswordHeader: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(description)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .lineSpacing(4)
        }
    }
}

private struct EmailInputField: View {
    @Binding var email: String
    
    var body: some View {
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
    }
}

private struct ResetActionButtons: View {
    let isLoading: Bool
    let primaryButtonTitle: String
    let secondaryButtonTitle: String
    let onPrimaryAction: () -> Void
    let onSecondaryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            // Primary Button (Continue)
            Button(action: onPrimaryAction) {
                HStack {
                    Spacer()
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text(primaryButtonTitle)
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
            .padding(.horizontal, 24)
            
            // Secondary Button (Switch method)
            Button(action: onSecondaryAction) {
                HStack {
                    Spacer()
                    Text(secondaryButtonTitle)
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
            .padding(.horizontal, 24)
        }
    }
}

private struct ReturnToLoginButton: View {
    let onDismiss: () -> Void
    
    var body: some View {
        Button(action: onDismiss) {
            HStack {
                Text("Return to")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                Text("Login")
                    .font(.system(size: 16))
                    .foregroundColor(Color("primaryColor"))
            }
        }
        .padding(.top, 8)
    }
}

private struct CreateAccountPrompt: View {
    var body: some View {
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
}

private struct BackButton: View {
    let onDismiss: () -> Void
    
    var body: some View {
        Button(action: onDismiss) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .foregroundColor(Color("textPrimary"))
        }
    }
}

#Preview {
    NavigationStack {
        RestWithMailView()
    }
}
