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
        .package(url: "https://github.com/readdle/vapor-core.git", from: "3.4.3"),

        /// Bindings to OpenSSL-compatible libraries for TLS support in SwiftNIO
        .package(url: "https://github.com/readdle/swift-nio-ssl.git", from: "1.2.2"),
    ],
    targets: [
        .target(name: "Crypto", dependencies: [
            "Async", "Bits", "Core", "COperatingSystem", "Debugging", "libbase32", "libbcrypt", "NIOOpenSSL", "Random"
        ]),
        .testTarget(name: "CryptoTests", dependencies: ["Crypto"]),
        .target(name: "libbase32"),
        .target(name: "libbcrypt"),
        .target(name: "Random", dependencies: ["Bits"]),
        .testTarget(name: "RandomTests", dependencies: ["Random"]),
    ]
)
