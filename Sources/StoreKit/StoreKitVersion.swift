
public enum StoreKitVersion: Sendable, Decodable {
    case v1
    case v2
    
    public static func validated(_ desired: StoreKitVersion) -> StoreKitVersion {
        switch desired {
        case .v2:
            if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *) {
                return .v2
            } else {
                return .v1
            }
        case .v1:
            return .v1
        }
    }
}

extension AdaptyConfiguration {
    @AdaptyActor
    static var storeKitVersion = Self.default.storeKitVersion
}
