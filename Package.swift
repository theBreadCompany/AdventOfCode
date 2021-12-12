// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    products: [
        .executable(name: "AdventOfCode", targets: ["AdventOfCode"])
    ],
    targets: [
        .target(
            name: "AdventOfCode",
            dependencies: ["Days"]),
        .target(
            name: "Days",
            resources: Array(1...12).map({.process("2021/Input/day\($0).txt")})),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: ["AdventOfCode", "Days"]),
    ]
)
