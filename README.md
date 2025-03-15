# Neugelb iOS Network

This repository contains an iOS project developed in Swift, focusing on network-related functionalities. It utilizes the Swift Package Manager for dependency management and includes unit tests to ensure code reliability.


## Features

This package includes the following services:

- **Movie Service**: Handles network requests related to movies.
- **Image Service**: Caches all images locally and stores them permanently in the file manager to improve performance and reduce network usage.
                                                                                                                                                    
## Project Structure

- **Sources/**: Contains the main source code for the project.
- **Tests/NeugelbNetworkTests/**: Holds the unit tests for the project.
- **Package.swift**: Defines the Swift package configuration.

## Requirements

- iOS 13.0 or later
- Swift 5.0 or later
- Xcode 12.0 or later

## Installation

To integrate this package into your project, add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/NeugelbTest/neugelb-ios-network.git", from: "1.0.0")
]
```

Then, include `"NeugelbNetwork"` as a dependency for your target:

```swift
target(
    name: "YourTargetName",
    dependencies: ["NeugelbNetwork"]
)
```

## Usage

Import the `NeugelbNetwork` module in your Swift files:

```swift
import NeugelbNetwork
```

*Provide examples of how to use the functionalities offered by the package.*

## Future Improvements

- **CI/CD Enhancements**: Further improve automation by refining build, test, and deployment workflows.
- **SwiftGen Integration**: Enhance type safety and performance using [SwiftGen](https://github.com/SwiftGen/SwiftGen) to generate type-safe accessors for assets.
- **More Unit Tests**: Expand test coverage to ensure robust functionality.
- **Documentation Improvements**: Add detailed API usage examples.

