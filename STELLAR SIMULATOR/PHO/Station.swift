//
//  Station.swift
//  STELLAR SIMULATOR
//
//  Created by Danxd on 6/25/26.
//

import Foundation

struct Station: Identifiable {
    let id: UUID = UUID()
    let name: String
    let x: CGFloat
    let y: CGFloat
    let width: CGFloat
    let height: CGFloat
    let line: Int
    var completed: Bool
}


struct Connection: Identifiable {
    let id = UUID()

    let from: CGPoint
    let to: CGPoint

    var completed: Bool
}
