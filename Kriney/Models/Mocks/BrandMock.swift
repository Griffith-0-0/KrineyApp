//
//  Brand+Mock.swift
//  Kriney
//
//  Created by automated assistant on 19/12/2025.
//

import Foundation

#if DEBUG
extension Brand {
    // Create brands that match the Car.tab mock data. Each brand's `carIds` links to cars in Car.tab
    static let mockData: [Brand] = [
        Brand(id: "1", brandName: "Dacia", imageName: "daciaLogo", carIds: ["1", "2", "3", "4", "5"]),
        Brand(id: "2", brandName: "Renault", imageName: "renaultLogo", carIds: ["6", "7", "8", "9", "10"]),
        Brand(id: "3", brandName: "Hyundai", imageName: "hyundaiLogo", carIds: ["11", "12", "13", "14", "15"]),
        Brand(id: "4", brandName: "Peugeot", imageName: "peugeotLogo", carIds: ["16", "17", "18", "19", "20"]),
        Brand(id: "5", brandName: "Volkswagen", imageName: "volkswagenLogo", carIds: ["21", "22", "23", "24", "25"]),
        Brand(id: "6", brandName: "Opel", imageName: "opelLogo", carIds: ["26", "27", "28", "29", "30"]),
        Brand(id: "7", brandName: "Citroën", imageName: "citroenLogo", carIds: ["31", "32", "33", "34", "35"]),
        Brand(id: "8", brandName: "Fiat", imageName: "fiatLogo", carIds: ["36", "37", "38", "39", "40"]),
        Brand(id: "9", brandName: "Toyota", imageName: "toyotaLogo", carIds: ["41", "42", "43", "44", "45"]),
        Brand(id: "10", brandName: "Audi", imageName: "audiLogo", carIds: ["46", "47", "48", "49", "50"]),
        Brand(id: "11", brandName: "BMW", imageName: "bmwLogo", carIds: ["51", "52", "53", "54", "55"]),
        Brand(id: "12", brandName: "Mercedes-Benz", imageName: "mercedesLogo", carIds: ["56", "57", "58", "59", "60"]),
        Brand(id: "13", brandName: "Nissan", imageName: "nissanLogo", carIds: ["61", "62", "63", "64", "65"]),
        Brand(id: "14", brandName: "MG", imageName: "mgLogo", carIds: ["66", "67", "68", "69", "70"])
    ]
}
#endif
