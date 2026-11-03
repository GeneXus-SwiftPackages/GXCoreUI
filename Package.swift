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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "5.1.0-rc.14")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXCoreUI-5.1.0-rc.14.xcframework.zip",
			checksum: "e2ba7d1026661578bc4fdb38ec97fced6c6a39633f44da0cee88b706b24431dd"
		)
	]
)