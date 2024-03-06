// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXCoreUI",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCoreUI",
			targets: ["GXCoreUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.5.0-beta.12")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreUI-1.5.0-beta.12.xcframework.zip",
			checksum: "1a3c3694e02eb12278437408fe212cd6a4ae0dff70bcb16528e2db24915ba32b"
		)
	]
)