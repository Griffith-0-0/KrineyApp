import SwiftUI

struct LoginView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    @State private var emailOrPhone: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var rememberMe: Bool = false
    @State private var showErrorAlert: Bool = false
    @State private var showSuccessAlert: Bool = false
    @FocusState private var focusedField: Field?
    
    enum Field {
        case emailOrPhone, password
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                AppLogoName()
                
                WelcomeHeader()
                
                LoginInputFields(
                    emailOrPhone: $emailOrPhone,
                    password: $password,
                    showPassword: $showPassword,
                    focusedField: $focusedField
                )
                
                RememberMeSection(rememberMe: $rememberMe)
                
                LoginActionButtons(
                    isLoading: authViewModel.isLoading,
                    onLoginTapped: loginTapped
                )
                
                DividerWithText(text: "Or")
                
                SocialLoginButtons()
                
                SignUpPrompt()
            }
            .padding(24)
        }
        .navigationBarHidden(true)
        .alert("Login Failed", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) {
                authViewModel.errorMessage = nil
            }
        } message: {
            Text(authViewModel.errorMessage ?? "An error occurred")
        }
        .alert("Login Success", isPresented: $showSuccessAlert) {
            Button("Continue") {
                // Navigate to main content
            }
        } message: {
            Text("Welcome back!")
        }
    }
    
    private func loginTapped() {
        // Validate inputs
        guard !emailOrPhone.isEmpty else {
            authViewModel.errorMessage = "Please enter your email"
            showErrorAlert = true
            return
        }
        
        guard !password.isEmpty else {
            authViewModel.errorMessage = "Please enter your password"
            showErrorAlert = true
            return
        }
        
        // Call login
        Task {
            await authViewModel.login(email: emailOrPhone, password: password)
            
            // Show error if login failed
            if authViewModel.errorMessage != nil {
                showErrorAlert = true
            } else {
                // Login successful - show success alert
                showSuccessAlert = true
            }
        }
    }
}

// MARK: - Subviews

private struct WelcomeHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("textPrimary"))
            Text("Ready to hit the road.")
                .font(.title3)
                .foregroundColor(Color("textPrimary"))
        }
        .padding(.top, 8)
    }
}

private struct LoginInputFields: View {
    @Binding var emailOrPhone: String
    @Binding var password: String
    @Binding var showPassword: Bool
    var focusedField: FocusState<LoginView.Field?>.Binding
    
    var body: some View {
        VStack(spacing: 12) {
            // Email/Phone Input
            TextField("Email/Phone Number", text: $emailOrPhone)
                .keyboardType(.emailAddress)
                .textContentType(.username)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(
                            focusedField.wrappedValue == .emailOrPhone ? Color("primaryColor") : Color.gray.opacity(0.3),
                            lineWidth: focusedField.wrappedValue == .emailOrPhone ? 2 : 1
                        )
                )
                .focused(focusedField, equals: .emailOrPhone)
            
            // Password Input with Toggle
            ZStack(alignment: .trailing) {
                Group {
                    if showPassword {
                        TextField("Password", text: $password)
                            .textContentType(.password)
                            .focused(focusedField, equals: .password)
                    } else {
                        SecureField("Password", text: $password)
                            .focused(focusedField, equals: .password)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(
                            focusedField.wrappedValue == .password ? Color("primaryColor") : Color.gray.opacity(0.3),
                            lineWidth: focusedField.wrappedValue == .password ? 2 : 1
                        )
                )
                
                Button(action: { showPassword.toggle() }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                }
            }
        }
    }
}

private struct RememberMeSection: View {
    @Binding var rememberMe: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: { rememberMe.toggle() }) {
                HStack(spacing: 8) {
                    Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                        .foregroundColor(Color("primaryColor"))
                    Text("Remember Me")
                        .font(.system(size: 14))
                        .foregroundColor(.textSecondary)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            NavigationLink(destination: RestWithMailView()) {
                Text("Forgot Password")
                    .font(.system(size: 14))
                    .foregroundColor(Color("primaryColor"))
            }
        }
    }
}

private struct LoginActionButtons: View {
    let isLoading: Bool
    let onLoginTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            // Login Button
            Button(action: onLoginTapped) {
                HStack {
                    Spacer()
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Login")
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
            
            // Sign Up Button
            NavigationLink(destination: SignUpView()) {
                HStack {
                    Spacer()
                    Text("Sign up")
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
    }
}

private struct DividerWithText: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray.opacity(0.3))
            Text(text)
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .font(.system(size: 14))
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray.opacity(0.3))
        }
        .padding(.vertical, 8)
    }
}

private struct SocialLoginButtons: View {
    var body: some View {
        VStack(spacing: 12) {
            SocialLoginButton(
                icon: "applelogo",
                title: "Apple pay",
                action: { /* Apple Pay */ }
            )
            
            SocialLoginButton(
                icon: "g.circle.fill",
                title: "Google Pay",
                action: { /* Google Pay */ }
            )
        }
    }
}

private struct SocialLoginButton: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("primaryColor"))
                Text(title)
                    .fontWeight(.medium)
                    .foregroundColor(Color("primaryColor"))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
}

private struct SignUpPrompt: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Don't have an account?")
                .font(.footnote)
                .foregroundColor(.gray)
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up.")
                    .font(.footnote)
                    .foregroundColor(Color("primaryColor"))
            }
            Spacer()
        }
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

#Preview {
    NavigationView {
        LoginView()
    }
}
