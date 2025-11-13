# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A Flutter application that displays SpaceX launch information, company details, and rocket data using the SpaceX API (v3). The app features a dark theme and uses a bottom navigation bar for main navigation between Home, Launches, Search (placeholder), and Menu sections.

## Essential Commands

### Development
```bash
# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d <device-id>

# Hot reload during development (press 'r' in terminal)
# Hot restart (press 'R' in terminal)

# Get dependencies
flutter pub get

# Clean build artifacts
flutter clean
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart
```

### Building
```bash
# Build for iOS
flutter build ios

# Build for Android
flutter build apk

# Build app bundle for Play Store
flutter build appbundle
```

### Code Analysis
```bash
# Analyze code for issues
flutter analyze
```

## Architecture

### Navigation Structure
The app uses a hybrid navigation approach:
- **RootPage** (`lib/screens/rootPage.dart`) is the entry point with a `PageView` containing 4 tabs controlled by a `PageController`
- **BottomMenu** (`lib/widgets/bottomMenu.dart`) uses `google_nav_bar` for bottom navigation that controls the PageView
- **Named routes** are defined in `lib/main.dart` and centralized in `lib/pageRoutes.dart` for push navigation to detail pages

Main navigation tabs (via PageView):
1. Home - Shows next and latest launches
2. Launches - List of all launches
3. Search - Placeholder (shows "Third tab" text)
4. Menu - Side menu with additional options

### Project Structure
```
lib/
├── data/           # DTOs for API responses (Launch, CompanyInfo, Rocket, ApiInfo)
├── screens/        # Screen widgets organized by feature
│   ├── home/       # Home screen with launch cards
│   ├── launches/   # Launches list and detail screens
│   └── info/       # Company info screen
├── services/       # API service layer
├── widgets/        # Reusable widgets (BottomMenu, NavDrawer)
├── main.dart       # App entry point with route definitions
└── pageRoutes.dart # Centralized route name constants
```

### Data Layer
- **DTOs** (`lib/data/`) define data models that map directly to SpaceX API v3 JSON responses
- All DTOs use `factory` constructors with `fromJson()` methods for JSON deserialization
- Key models: `Launch`, `LaunchDto`, `CompanyInfoDto`, `RocketDto`, `ApiInfoDto`

### API Integration
- **Service**: `lib/services/spacex_api.dart`
- **Base URL**: `https://api.spacexdata.com/v3`
- **Caching**: Uses `flutter_cache_manager` to cache all API responses locally
- **Key endpoints**:
  - `/info` - Company information
  - `/launches/latest` - Most recent launch
  - `/launches/next` - Upcoming launch
  - Base endpoint for API metadata

All API calls return cached responses via `DefaultCacheManager().getSingleFile()`. The cache manager handles network requests, storage, and staleness automatically.

### UI Patterns
- **Shimmer loading**: Uses `shimmer` package for loading states
- **Bottom navigation**: `google_nav_bar` with 4 tabs controlling a `PageView`
- **Theme**: Dark mode with `Brightness.dark` and blue primary swatch
- **Date formatting**: Uses `intl` package with `en_US` as default locale
- **Links**: `flutter_linkify` and `url_launcher` for handling external links

## Important Notes

### API Version
This project uses SpaceX API **v3** which may have different data structures than newer versions. When modifying API calls, ensure compatibility with v3 endpoints.

### Navigation Implementation
When adding new screens:
1. Create route name constant in the screen file (e.g., `static const String routeName = '/my-screen'`)
2. Add route to `pageRoutes.dart`
3. Add route mapping in `main.dart` routes map
4. For tab navigation, modify `RootPage.homePages` list and update `BottomMenu` tabs

### Testing
The project includes minimal testing (`test/widget_test.dart`). When adding features, create corresponding test files.

### iOS Development
The `ios/Podfile` is configured for the project. Run `pod install` in the `ios/` directory after pulling or when iOS dependencies change.
