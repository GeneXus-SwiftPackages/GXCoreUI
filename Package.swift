// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreUI",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXCoreUI",
			targets: ["GXCoreUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "4.2.0-rc.3")
	],
	targets: [
		.target(name: "GXCoreUIWrapper",
				dependencies: [
					"GXCoreUI",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreUI",
			url: "https://pkgs.genexus.dev/iOS/preview/GXCoreUI-4.2.0-rc.3.xcframework.zip",
			checksum: "889937d3ccbca8d721b2a60edc47212065c5f62080181e950e2875347d1e83a2"
		)
	]
)