# OCRBooster

OCRBooster is an Objective-C application designed to provide optical character recognition capabilities on macOS. The application allows users to extract text from images through a clean and intuitive interface.

## Overview

This project is built using Objective-C and follows the Model-View-ViewModel architecture pattern to maintain clear separation of concerns and improve code maintainability. The application leverages native macOS frameworks to deliver reliable OCR functionality.

## Project Structure

The application is organized into several key components:

- **AppDelegate**: Handles application lifecycle events and initialization
- **ViewController**: Manages the user interface and user interactions
- **ViewModel**: Contains the presentation logic and coordinates between the view and services
- **Services**: Houses the OCRService which handles the core text recognition functionality
- **Tests**: Includes unit tests for both the OCR service and view model components

## Requirements

- macOS development environment
- Xcode installed with Objective-C support
- Compatible macOS version for running the application

## Building the Project

Open the project in Xcode by double-clicking the OCRBooster.xcodeproj file. You can build and run the application using the standard Xcode build commands or by pressing Command+R.

## Testing

The project includes unit tests to ensure reliability of the core components. You can run the test suite through Xcode's test navigator or by using the Command+U keyboard shortcut.

## Architecture

The application follows the MVVM pattern which provides several benefits:

- Clear separation between user interface and business logic
- Improved testability of components
- Better code organization and maintainability
- Easier to extend and modify functionality

## License

This project is provided as-is for development and testing purposes.
