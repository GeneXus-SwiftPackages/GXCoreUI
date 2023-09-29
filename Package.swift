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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.2.0-beta.32")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreUI-1.2.0-beta.32.xcframework.zip",
			checksum: "a1527969cc3317ac63fde9f8fd2f01019645857844a6577c136b025570202354"
		)
	]
)