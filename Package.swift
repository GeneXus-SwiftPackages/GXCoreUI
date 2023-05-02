// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXCoreUI",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCoreUI",
			targets: ["GXCoreUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", branch: "beta")
	],
	targets: [
		.target(name: "GXCoreUIWrapper",
				dependencies: [
					"GXCoreUI",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreUI-1.0.0-beta+20230502131235.xcframework.zip",
			checksum: "2a21bb6b098b7b3a51706e1255ed05419df4db08b8544d2580e22b823a526ff7"
		)
	]
)