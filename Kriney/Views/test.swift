//
//  test.swift
//  Kriney
//
//  Created by user on 23/12/2025.
//

import SwiftUI

struct test: View {
    let brandLogos = [
        "audiLogo",
        "bmwLogo",
        "citroenLogo",
        "daciaLogo",
        "hyundaiLogo",
        "mercedesLogo",
        "mgLogo",
        "nissanLogo",
        "opelLogo",
        "peugeotLogo",
        "renaultLogo",
        "toyotaLogo",
        "volkswagenLogo"
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(brandLogos, id: \.self) { logo in
                    BrandLogoSquare(logoName: logo)
                }
            }
            .padding()
        }
        .navigationTitle("Brand Logos")
    }
}

struct BrandLogoSquare: View {
    let logoName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            Image(logoName)
                .resizable()
                .scaledToFit()
                .padding(12)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    NavigationView {
        test()
    }
}
