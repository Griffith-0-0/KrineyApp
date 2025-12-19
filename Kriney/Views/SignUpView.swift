//
//  SignUpView.swift
//  Kriney
//
//  Created by user on 21/12/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName: String = ""
    @State private var emailAddress: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var country: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    @State private var isLoading: Bool = false
    @State private var userType: UserType = .driver
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) var dismiss
    
    enum UserType: String, CaseIterable {
        case driver = "Driver (Client)"
        case agency = "Agency"
    }
    
    enum Field {
        case fullName, emailAddress, phone, password, confirmPassword, country
    }
    
    private func signUpInputs() -> some View {
        VStack(spacing: 12) {
            TextField("Full Name", text: $fullName)
                .textContentType(.name)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(focusedField == .fullName ? Color("primaryColor") : Color.gray.opacity(0.3), lineWidth: focusedField == .fullName ? 2 : 1))
                .focused($focusedField, equals: .fullName)
            
            TextField("Email Address", text: $emailAddress)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(focusedField == .emailAddress ? Color("primaryColor") : Color.gray.opacity(0.3), lineWidth: focusedField == .emailAddress ? 2 : 1))
                .focused($focusedField, equals: .emailAddress)
            
            // Phone Number with +212 prefix
            HStack(spacing: 0) {
                Text("+212")
                    .foregroundColor(Color("textPrimary"))
                    .padding(.leading, 16)
                    .padding(.vertical, 16)
                
                TextField("Phone Number", text: $phone)
                    .keyboardType(.numberPad)
                    .padding(.leading, 8)
                    .padding(.vertical, 16)
                    .padding(.trailing, 16)
                    .focused($focusedField, equals: .phone)
            }
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(focusedField == .phone ? Color("primaryColor") : Color.gray.opacity(0.3), lineWidth: focusedField == .phone ? 2 : 1))
            
            ZStack(alignment: .trailing) {
                Group {
                    if showPassword {
                        TextField("Password", text: $password)
                            .textContentType(.newPassword)
                            .focused($focusedField, equals: .password)
                    } else {
                        SecureField("Password", text: $password)
                            .focused($focusedField, equals: .password)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(focusedField == .password ? Color("primaryColor") : Color.gray.opacity(0.3), lineWidth: focusedField == .password ? 2 : 1))
                
                Button(action: { showPassword.toggle() }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                }
            }
            
            ZStack(alignment: .trailing) {
                Group {
                    if showConfirmPassword {
                        TextField("Confirm Password", text: $confirmPassword)
                            .textContentType(.newPassword)
                            .focused($focusedField, equals: .confirmPassword)
                    } else {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .focused($focusedField, equals: .confirmPassword)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(focusedField == .confirmPassword ? Color("primaryColor") : Color.gray.opacity(0.3), lineWidth: focusedField == .confirmPassword ? 2 : 1))
                
                Button(action: { showConfirmPassword.toggle() }) {
                    Image(systemName: showConfirmPassword ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                }
            }
            
            // User Type Selection
            VStack(alignment: .leading, spacing: 8) {
                Text("I am a:")
                    .font(.subheadline)
                    .foregroundColor(Color("textSecondary"))
                
                HStack(spacing: 12) {
                    ForEach(UserType.allCases, id: \.self) { type in
                        Button(action: { userType = type }) {
                            HStack(spacing: 8) {
                                Image(systemName: type == .driver ? "person.fill" : "building.2.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(userType == type ? Color("primaryColor") : Color.gray)
                                
                                Text(type.rawValue)
                                    .font(.system(size: 13))
                                    .foregroundColor(Color("textPrimary"))
                                    .multilineTextAlignment(.center)
                                
//                                Image(systemName: userType == type ? "checkmark.circle.fill" : "circle")
//                                    .font(.system(size: 16))
//                                    .foregroundColor(userType == type ? Color("primaryColor") : Color.gray)
                            }
                            .padding(.vertical, 5)
//                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(userType == type ? Color("primaryColor") : Color.gray.opacity(0.3), lineWidth: userType == type ? 2 : 1)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                AppLogoName()
                
                // Sign Up title
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("textPrimary"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 8)
                
                signUpInputs()
                
                // Buttons
                VStack(spacing: 12) {
                    Button(action: { signUpTapped() }) {
                        HStack {
                            Spacer()
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Sing up")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("white"))
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color("textPrimary"))
                        .cornerRadius(30)
                    }
                    .disabled(isLoading)
                    
                    Button(action: { dismiss() }) {
                        HStack {
                            Spacer()
                            Text("Login")
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
                }
                
                // Or separator
                HStack(alignment: .center) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.3))
                    Text("Or")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                        .font(.system(size: 14))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.3))
                }
                .padding(.vertical, 8)
                
                // Social buttons
                VStack(spacing: 12) {
                    Button(action: { /* Apple Pay */ }) {
                        HStack(spacing: 12) {
                            Image(systemName: "applelogo")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(Color("textPrimary"))
                            Text("Apple pay")
                                .fontWeight(.medium)
                                .foregroundColor(Color("textPrimary"))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                    
                    Button(action: { /* Google Pay */ }) {
                        HStack(spacing: 12) {
                            Image(systemName: "g.circle.fill")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(Color("textPrimary"))
                            Text("Google Pay")
                                .fontWeight(.medium)
                                .foregroundColor(Color("textPrimary"))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                }
                
                // Bottom helper text
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Button(action: { dismiss() }) {
                            
                            Text("Login.")
                                .font(.footnote)
                                .foregroundColor(Color("primaryColor"))
                            
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            .padding(24)
        }
        .navigationBarHidden(true)
    }
    
    private func signUpTapped() {
        // simulate loading
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoading = false
            // TODO: perform actual sign up
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
    SignUpView()
}
