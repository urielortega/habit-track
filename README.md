# Habit Track

A SwiftUI app to track personal habits. The app uses `@StateObject` to share data across views and `@ObservedObject` to display it. Data is stored using `JSONEncoder` and `JSONDecoder`, saved in `UserDefaults`.

## Features
- Track habits with a simple and intuitive interface.
- Save habit data locally using `UserDefaults`.
- Use `JSONDecoder` and `JSONEncoder` for data persistence.

## Topics Covered
- Swift
- SwiftUI
- `UserDefaults`
- JSON Parsing

## How to Use
Clone the repository and open the project in Xcode. Run the app to start tracking your habits. Habit data will be saved and reloaded on app launch, using `UserDefaults`.

## Acknowledgments  
This project idea was originally proposed as part of the 100 Days of SwiftUI course by [Paul Hudson](https://github.com/twostraws). The solution implemented here reflects my personal approach, design decisions, and coding style.
