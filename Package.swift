// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SQLite.swift",
    products: [.library(name: "SQLiteDotSwift", targets: ["SQLiteDotSwift"])],
    targets: [
        .target(name: "SQLiteDotSwift", dependencies: ["SQLiteObjc"], path: "Sources/SQLite"),
        .target(name: "SQLiteObjc"),
        .testTarget(name: "SQLiteDotSwiftTests", dependencies: ["SQLiteDotSwift"], path: "Tests/SQLiteTests")
    ],
    swiftLanguageVersions: [4]
)

#if os(Linux)
    package.dependencies = [.package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")]
    package.targets = [
        .target(name: "SQLiteDotSwift", path: "Sources/SQLite", exclude: ["Extensions/FTS4.swift", "Extensions/FTS5.swift"]),
        .testTarget(name: "SQLiteDotSwiftTests", dependencies: ["SQLiteDotSwift"], path: "Tests/SQLiteTests", exclude: [
            "FTS4Tests.swift",
            "FTS5Tests.swift"
        ])
    ]
#endif
