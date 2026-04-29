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
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.6/StytchConsumerSDK.xcframework.zip",
            checksum: "25816200b380bf46bf6c03e8d01fa33930a8798f26e58b447e9f0dc845fc1039"
        ),
        .binaryTarget(
            name: "StytchB2BFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.6/StytchB2BSDK.xcframework.zip",
            checksum: "560a316d5f23863585dbf17faea789cef8dc2e40dc28c49318182d06446084b7"
        ),
        .binaryTarget(
            name: "StytchSwiftUtilsFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.6/StytchSwiftUtils.xcframework.zip",
            checksum: "854313c353195dbda954dd333d64e139e28f0fb51a1b781a3350246f2dcd41c4"
        ),
        .binaryTarget(
            name: "StytchSharedFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.6/StytchSharedSDK.xcframework.zip",
            checksum: "803f5e4132041d90d71ee4ebf158d45ce88b798791c4ee79e0c801be0545f97f"
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
