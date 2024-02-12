//
//  File.swift
//  
//
//  Created by Павел Пономарёв on 14.01.2024.
//

import Foundation

import Foundation
import SwiftUI

public struct CardView: View {
    
    private let color: Color
    private let cornerRadius: Double
    private let colorShadow: Color
    private let radiusShadow: Double
    
    
    public init(color: Color,
                cornerRadius: Double  = 6,
                colorShadow: Color = Color.black.opacity(0.2),
                radiusShadow: Double  = 4) {
        self.color = color
        self.cornerRadius = cornerRadius
        self.colorShadow = colorShadow
        self.radiusShadow = radiusShadow

    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .foregroundColor(color)
            .shadow(color: colorShadow, radius: radiusShadow)
    }
}
