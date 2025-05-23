//
//  File.swift
//  Adapty
//
//  Created by Aleksey Goncharov on 13.11.2024.
//

import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public extension AdaptyUI {
    struct View: Sendable {
        package let id: String
        package let templateId: String
        package let placementId: String
        package let paywallVariationId: String
    }
}

#if canImport(UIKit)

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public extension AdaptyPaywallController {
    func toAdaptyUIView() -> AdaptyUI.View {
        AdaptyUI.View(
            id: id.uuidString,
            templateId: paywallConfiguration.paywallViewModel.viewConfiguration.templateId,
            placementId: paywallConfiguration.paywallViewModel.paywall.placementId,
            paywallVariationId: paywallConfiguration.paywallViewModel.paywall.variationId
        )
    }
}

#endif
