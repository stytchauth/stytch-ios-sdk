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
        .package(url: "https://github.com/stytchauth/stytch-ios-dfp.git", .exact("1.0.5")),
    ],
    targets: [
        .binaryTarget(
            name: "StytchConsumerFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.0/StytchConsumerSDK.xcframework.zip",
            checksum: "d5450d1b6634d07ed9a002dddb7625d27982a08a8510d24b57a29cca7b480361"
        ),
        .binaryTarget(
            name: "StytchB2BFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.0/StytchB2BSDK.xcframework.zip",
            checksum: "0e9cf0656ad8c73a5e2cfeef5bafe5d859875cb04f22fa3a12fee02aa01740fa"
        ),
        .binaryTarget(
            name: "StytchSwiftUtilsFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.0/StytchSwiftUtils.xcframework.zip",
            checksum: "9a69995831f550c98a3a90392a3edd03dbed386d605282c916c19cf913af3eac"
        ),
        .binaryTarget(
            name: "StytchSharedFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.0/StytchSharedSDK.xcframework.zip",
            checksum: "1fe908603e72718e9b644ed3c8180902ed23d26b2f3407a22186a2b71fc51ccd"
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
