// swift-tools-version:5.8
import PackageDescription
 
let package = Package(
    name: "PlaywireMobile",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "PlaywireMobile",
            targets: ["PlaywireMobile"]
        ),
        .library(
            name: "PlaywireMobileVAST",
            targets: ["_PlaywireMobileVAST"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios", exact: "3.19.2")
    ],
    targets: [
        .target(
            name: "_PlaywireMobileVAST",
            dependencies: [
                "PlaywireMobile",
                "PlaywireMobileVAST",
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios")
            ],
            path: "PlaywireMobileVAST"
        ),
        .binaryTarget(
            name: "PlaywireMobile",
            path: "PlaywireMobile.xcframework"
        ),
        .binaryTarget(
            name: "PlaywireMobileVAST",
            path: "PlaywireMobileVAST.xcframework"
        )
    ]
)
