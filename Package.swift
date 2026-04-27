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
        .package(url: "https://github.com/stytchauth/stytch-ios-dfp.git", .exact("1.0.6")),
    ],
    targets: [
        .binaryTarget(
            name: "StytchConsumerFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.2/StytchConsumerSDK.xcframework.zip",
            checksum: "68c01f38b1e10bd47c998607bb6bc2042edc18a81c4a4c3ae927cc310c996ae6"
        ),
        .binaryTarget(
            name: "StytchB2BFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.2/StytchB2BSDK.xcframework.zip",
            checksum: "0036d42114a76c72fd4e7d8b8829d627a2f9b1d91ed1c5c908dc7bc6aadf49ae"
        ),
        .binaryTarget(
            name: "StytchSwiftUtilsFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.2/StytchSwiftUtils.xcframework.zip",
            checksum: "f71acdb2b8aa9ba33a48b4be2fd52afe0d062169be793a79dff733c5576d6197"
        ),
        .binaryTarget(
            name: "StytchSharedFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.2/StytchSharedSDK.xcframework.zip",
            checksum: "d7f0f8090240e5cc9fe995019bfb8bab4cccba8fa19dd9b33567db133c63c92f"
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
