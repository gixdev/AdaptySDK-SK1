
## StoreKit Version Configuration

You can now explicitly configure which version of StoreKit to use (v1 or v2) when initializing the Adapty SDK.

To set the StoreKit version, use the `.storeKitVersion` property on `AdaptyConfiguration`:

```swift
let config = AdaptyConfiguration
    .builder(withAPIKey: "PUBLIC_SDK_KEY")
    .with(storeKitVersion: .v1) // Use .v1 or .v2 as needed

Adapty.activate(with: config.build())
```

### Supported values

- `.v1` – Use legacy StoreKit 1 API.
- `.v2` – Use new StoreKit 2 API.
