# SwiftUI Kittens

SwiftUI Kittens is a library that provides a set of customizable UI components inspired by React Native Kitten UI. It allows you to quickly and easily build beautiful user interfaces for your iOS applications using SwiftUI.

![SwiftUI Kittens Demo](demo.gif)

## Features

- Collection of reusable and customizable UI components
- Consistent and modern design inspired by React Native Kitten UI
- Easy integration into your SwiftUI projects
- Compatible with iOS 16 and later

## Installation

To use SwiftUI Kittens in your project, follow these steps:

1. Add the SwiftUI Kittens package to your Xcode project using Swift Package Manager.

2. In Xcode, select your project in the Project Navigator.

3. Go to the "Swift Packages" tab.

4. Click the "+" button to add a package dependency.

5. Enter the package URL: `https://github.com/sarimk80/SwiftUI-kittens.git`

6. Select the version rule as "Up to Next Major" with "16.0.0" as the minimum version.

7. Click "Next" and then "Finish" to add the package to your project.

## Usage

SwiftUI Kittens provides a wide range of UI components that you can use in your SwiftUI views. To use a component, simply import the SwiftUI Kittens module and start using the desired component in your code.

```swift
import SwiftUI
import Kitten_ui

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Hello")
            }, label: {
                Text("Hello world!")
            })
            .kittenButton()
            
            Button(action: {
                print("Hello")
            }, label: {
                Text("Hello world!")
            })
            .kittenOutlineButton(buttonStatus: .warning)
        }
    }
}

