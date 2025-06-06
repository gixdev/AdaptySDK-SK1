//
//  CurveUpShape.swift
//
//
//  Created by Aleksey Goncharov on 13.06.2024.
//

#if canImport(UIKit)

import Adapty
import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
struct CurveUpShape: InsettableShape {
    var curveHeight: CGFloat = 32.0

    func inset(by amount: CGFloat) -> some InsettableShape {
        CurveUpShape()
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))

        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + curveHeight))

        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + curveHeight),
                          control: CGPoint(x: rect.midX, y: rect.minY))

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        path.closeSubpath()
        return path
    }
}

#endif
