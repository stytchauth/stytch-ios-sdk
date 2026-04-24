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
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.1/StytchConsumerSDK.xcframework.zip",
            checksum: "0971f5fdbccba2acd72d99ede16d60fe8d9b2fe1923878c3f747ccfb7e48bee9"
        ),
        .binaryTarget(
            name: "StytchB2BFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.1/StytchB2BSDK.xcframework.zip",
            checksum: "0fbfd4640264a54a5ab3f9c6a43cae60738f4142dd587e9a34a64b984879c1e8"
        ),
        .binaryTarget(
            name: "StytchSwiftUtilsFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.1/StytchSwiftUtils.xcframework.zip",
            checksum: "5c48085315186cd6f05ac389741060e4dbb236cf4c3b2ff5de06898f0c6a3dda"
        ),
        .binaryTarget(
            name: "StytchSharedFramework",
            url: "https://github.com/stytchauth/stytch-ios-sdk/releases/download/1.0.1/StytchSharedSDK.xcframework.zip",
            checksum: "ad7af5472f729a0e0397f9be5224fdb55aa04751aa40b20e51d446895d94d8bd"
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
