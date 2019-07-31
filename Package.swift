// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Crypto",
    products: [
        .library(name: "Crypto", targets: ["Crypto"]),
        .library(name: "Random", targets: ["Random"]),
    ],
    dependencies: [
        // 🌎 Utility package containing tools for byte manipulation, Codable, OS APIs, and debugging.
        .package(url: "https://github.com/readdle/vapor-core.git", .branch("3.9.1-android")),

        /// Bindings to OpenSSL-compatible libraries for TLS support in SwiftNIO
        .package(url: "https://github.com/readdle/swift-nio-ssl.git", .branch("1.4.0-android")),
    ],
    targets: [
        .target(name: "CBase32"),
        .target(name: "CBcrypt"),
        .target(name: "CCryptoOpenSSL"),
        .target(name: "Crypto", dependencies: [
            "Async",
            "Bits",
            "CBase32",
            "CBcrypt",
            "CCryptoOpenSSL",
            "Core",
            "COperatingSystem",
            "Debugging",
            "Random"
        ]),
        .testTarget(name: "CryptoTests", dependencies: ["Crypto"]),
        .target(name: "Random", dependencies: ["Bits"]),
        .testTarget(name: "RandomTests", dependencies: ["Random"]),
    ]
)
