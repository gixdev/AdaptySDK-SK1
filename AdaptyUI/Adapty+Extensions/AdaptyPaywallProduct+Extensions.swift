//
//  AdaptyPaywallProductExtensions.swift
//
//
//  Created by Alexey Goncharov on 2023-01-24.
//

import Adapty
import Foundation

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension AdaptyProduct {
    func pricePer(period: AdaptySubscriptionPeriod.Unit) -> String? {
        guard let subscriptionPeriod = subscriptionPeriod else { return nil }

        let numberOfPeriods = subscriptionPeriod.numberOfPeriods(period)
        guard numberOfPeriods > 0.0 else { return nil }

        let numberOfPeriodsDecimal = Decimal(floatLiteral: numberOfPeriods)
        let pricePerPeriod = price / numberOfPeriodsDecimal
        let nsDecimalPricePerPeriod = NSDecimalNumber(decimal: pricePerPeriod)

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let sk2Product = sk2Product {
            formatter.locale = sk2Product.priceFormatStyle.locale
        } else if let sk1Product = sk1Product {
            formatter.locale = sk1Product.priceLocale
        } else {
            return nil
        }
        
        return formatter.string(from: nsDecimalPricePerPeriod)
    }
}
