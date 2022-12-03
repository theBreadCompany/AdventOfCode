// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// Yes, these module names are cursed, but see... just read the 'i' of 'i2021' as 'iteration 2021' and ignore it lol

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
            dependencies: ["Year", "i2021", "i2022"]),
        .target(
            name: "Year"),
        .target(
            name: "i2021",
            dependencies: ["Year"],
            resources: Array(1...14).map({.process("Input/day\($0).txt")})),
        .target(
            name: "i2022",
            dependencies: ["Year"],
            resources: Array(1...3).map({.process("Input/day\($0).txt")})),
        .testTarget(
            name: "AdventOfCodeTests",
            dependencies: ["AdventOfCode", "Days"]),
    ]
)
