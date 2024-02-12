//
//  ButtonCell.swift
//  
//
//  Created by Павел Пономарёв on 14.01.2024.
//

import Foundation
import SwiftUI

public struct ButtonCell<Content>: View where Content: View {
    
    private let color: Color
    private let cornerRadius: Double
    private let colorShadow: Color
    private let radiusShadow: Double
    private let bgOpacityMax: Double
    private let bgOpacityMin: Double
    private let paddingView: Double
    
    private let action: ()->Void
    private let content: ()->Content
    
    @State var bgOpacity: Double = 1
    
    public init(color: Color,
                cornerRadius: Double  = 6,
                colorShadow: Color = Color.black.opacity(0.2),
                radiusShadow: Double  = 4,
                bgOpacityMax: Double  = 1,
                bgOpacityMin: Double  = 0.8,
                paddingView: Double  = 14,
                action: @escaping () -> Void,
                @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.cornerRadius = cornerRadius
        self.colorShadow = colorShadow
        self.radiusShadow = radiusShadow
        self.bgOpacityMax = bgOpacityMax
        self.bgOpacityMin = bgOpacityMin
        self.paddingView = paddingView
        self.action = action
        self.content = content
        bgOpacity = bgOpacityMax
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(color)
                .opacity(bgOpacity)
                .shadow(color: colorShadow, radius: radiusShadow)
            HStack {
                content()
            }
            .padding(paddingView)
        }
        .fixedSize()
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .onChanged { _ in
                    withAnimation {
                        bgOpacity = bgOpacityMin
                    }
                }
                .onEnded { _ in
                    bgOpacity = bgOpacityMax
                    action()
                }
            
        )
    }
}
