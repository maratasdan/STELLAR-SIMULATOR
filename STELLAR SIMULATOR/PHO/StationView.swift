//
//  StationView.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/25/26.
//

import SwiftUI


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64

        switch hex.count {
        case 3:
            (a, r, g, b) = (
                255,
                (int >> 8) * 17,
                (int >> 4 & 0xF) * 17,
                (int & 0xF) * 17
            )
        case 6:
            (a, r, g, b) = (
                255,
                int >> 16,
                int >> 8 & 0xFF,
                int & 0xFF
            )
        case 8:
            (a, r, g, b) = (
                int >> 24,
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF
            )
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct StationView: View {
    
    let station: Station
    
    var body: some View {
        VStack {
                
            Text(station.name)
                .font(.title2)
                .foregroundStyle(Color.white)

        }
        .frame(
            width: station.width,
            height: station.height
        )
        .background(
            station.completed
            ? Color.white.opacity(0.5)
//            : Color(hex: "#cce0ff")
            : Color.white.opacity(0.2)
        )
        .border(Color.white, width: 1)
        
        
    }
    
}

