//
//  OtpView.swift
//  Kriney
//
//  Created by user on 22/12/2025.
//

import SwiftUI

struct OtpView: View {
    let contactInfo: String // Email or phone number to display
    
    @Environment(\.dismiss) private var dismiss
    @State private var otpDigits: [String] = Array(repeating: "", count: 5)
    @State private var isLoading = false

    private var codeString: String { otpDigits.joined() }
    private var isComplete: Bool { !otpDigits.contains("") }

    var body: some View {
        VStack(spacing: 24) {
            OtpHeader()
            
            VerificationCodeHeader(contactInfo: contactInfo)
            
            OtpCodeInputs(otpDigits: otpDigits)
            
            ContinueButton(
                isLoading: isLoading,
                isComplete: isComplete,
                onContinue: handleContinue
            )
            
            ResendSection(onResend: handleResend)
            
            NumericKeypad(
                codeString: codeString,
                isLoading: isLoading,
                onKeyTap: handleKeyTap
            )
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background").ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }

    private func handleKeyTap(_ key: String) {
        guard !isLoading else { return }

        if key == "delete" {
            deleteLastDigit()
            return
        }

        guard !key.isEmpty, key.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else { return }
        guard let firstEmptyIndex = otpDigits.firstIndex(where: { $0.isEmpty }) else { return }

        otpDigits[firstEmptyIndex] = key
    }

    private func deleteLastDigit() {
        guard let lastFilledIndex = otpDigits.lastIndex(where: { !$0.isEmpty }) else { return }
        otpDigits[lastFilledIndex] = ""
    }

    private func handleContinue() {
        guard isComplete else { return }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoading = false
            dismiss()
        }
    }

    private func handleResend() {
        otpDigits = Array(repeating: "", count: 5)
    }
}

// MARK: - Subviews

private struct OtpHeader: View {
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 48, height: 48)
                Image(systemName: "car.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
            }

            Text("Kriney")
                .font(.title2).bold()
                .foregroundColor(Color("textPrimary"))

            Spacer()
        }
        .padding(.top, 8)
    }
}

private struct VerificationCodeHeader: View {
    let contactInfo: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Enter verification code")
                .font(.title2).bold()
                .foregroundColor(Color("textPrimary"))
                .multilineTextAlignment(.center)

            Text("We have send a Code to : \(contactInfo)")
                .font(.subheadline)
                .foregroundColor(Color("textSecondary"))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 16)
    }
}

private struct OtpCodeInputs: View {
    let otpDigits: [String]
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<otpDigits.count, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    .frame(height: 60)
                    .overlay(
                        Text(otpDigits[index])
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("textPrimary"))
                    )
            }
        }
        .padding(.horizontal, 4)
    }
}

private struct ContinueButton: View {
    let isLoading: Bool
    let isComplete: Bool
    let onContinue: () -> Void
    
    var body: some View {
        Button(action: onContinue) {
            HStack {
                Spacer()
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(Color("white"))
                } else {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("white"))
                }
                Spacer()
            }
            .padding()
            .background(Color("textPrimary"))
            .cornerRadius(30)
        }
        .disabled(!isComplete || isLoading)
        .opacity(!isComplete || isLoading ? 0.7 : 1)
    }
}

private struct ResendSection: View {
    let onResend: () -> Void
    
    var body: some View {
        HStack(spacing: 6) {
            Spacer()
            Text("Didn't receive the OTP?")
                .font(.footnote)
                .foregroundColor(Color("textSecondary"))
            Button(action: onResend) {
                Text("Resend.")
                    .font(.footnote)
                    .foregroundColor(Color("primaryColor"))
            }
            .buttonStyle(.plain)
            Spacer()
        }
    }
}

private struct NumericKeypad: View {
    let codeString: String
    let isLoading: Bool
    let onKeyTap: (String) -> Void
    
    private let keypadKeys: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "delete"]
    
    var body: some View {
        VStack(spacing: 16) {
            KeypadDisplay(codeString: codeString)
            
            KeypadGrid(
                keys: keypadKeys,
                isLoading: isLoading,
                onKeyTap: onKeyTap
            )
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 4)
        )
    }
}

private struct KeypadDisplay: View {
    let codeString: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text("Form Message")
                .font(.subheadline)
                .foregroundColor(Color("textSecondary"))
            Text(codeString.isEmpty ? "_ _ _ _ _" : codeString)
                .font(.headline)
                .foregroundColor(Color("textPrimary"))
        }
    }
}

private struct KeypadGrid: View {
    let keys: [String]
    let isLoading: Bool
    let onKeyTap: (String) -> Void
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
            ForEach(keys, id: \.self) { key in
                KeypadButton(
                    key: key,
                    isLoading: isLoading,
                    onKeyTap: onKeyTap
                )
            }
        }
    }
}

private struct KeypadButton: View {
    let key: String
    let isLoading: Bool
    let onKeyTap: (String) -> Void
    
    var body: some View {
        Button(action: { onKeyTap(key) }) {
            keyContent
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
        .disabled(key.isEmpty || isLoading)
    }
    
    @ViewBuilder
    private var keyContent: some View {
        if key == "delete" {
            Image(systemName: "delete.left")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(Color("textPrimary"))
        } else if key.isEmpty {
            Text("")
        } else {
            Text(key)
                .font(.title3)
                .foregroundColor(Color("textPrimary"))
        }
    }
}

#Preview {
    NavigationView {
        OtpView(contactInfo: "+212******89")
    }
}
