// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Stytch",
    platforms: [
        .iOS("15.0")
      ],
    products: [
        .library(name: "StytchConsumerSDK", targets: ["StytchConsumerTarget"]),
        .library(name: "StytchB2BSDK", targets: ["StytchB2BTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/GoogleCloudPlatform/recaptcha-enterprise-mobile-sdk", from: "18.8.1"),
        .package(url: "https://github.com/stytchauth/stytch-ios-dfp.git", .exact("1.0.8")),
    ],
    targets: [
        .binaryTarget(
            name: "StytchConsumerFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.9/StytchConsumerSDK.xcframework.zip",
            checksum: "79833770d6ad3af8fd112d10847f587dfa3462c32f9d2ff03b745b8fa7a8f492"
        ),
        .binaryTarget(
            name: "StytchB2BFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.9/StytchB2BSDK.xcframework.zip",
            checksum: "fc337b221e14e861263cb561d540db988313ebf4126dcb2ab0f34c1b30f2530d"
        ),
        .binaryTarget(
            name: "StytchSwiftUtilsFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.9/StytchSwiftUtils.xcframework.zip",
            checksum: "76239a823184e81a55b403d1fa5c14665260d48d8bc4622c53d1305e8e32e3e2"
        ),
        .binaryTarget(
            name: "StytchSharedFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.9/StytchSharedSDK.xcframework.zip",
            checksum: "d222836a19c4df3b82cc64a224390dd079df7fc8dc44d360f2185254fa06dec4"
        ),
        .target(
            name: "StytchConsumerTarget",
            dependencies: [
                "StytchConsumerFramework",
                "StytchSwiftUtilsFramework",
                "StytchSharedFramework",
                .product(name: "StytchDFP", package: "stytch-ios-dfp")
            ]
        ),
        .target(
            name: "StytchB2BTarget",
            dependencies: [
                "StytchB2BFramework",
                "StytchSwiftUtilsFramework",
                "StytchSharedFramework",
                .product(name: "StytchDFP", package: "stytch-ios-dfp")
            ]
        ),
    ]
)
