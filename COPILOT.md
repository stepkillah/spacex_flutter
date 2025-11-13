# COPILOT.md

Guidance for GitHub Copilot (GPT-based assistants) when collaborating on this repository.

## Project Snapshot

- Flutter application that surfaces SpaceX (API v3) launch data, company info, and supporting details.
- Primary entry point: `lib/main.dart`, with named routes centralized in `lib/pageRoutes.dart`.
- UI is organized into feature folders under `lib/screens/` (home, launches, info, menu) and shared widgets under `lib/widgets/`.
- Data Transfer Objects live in `lib/data/`; API access is handled exclusively through `lib/services/spacex_api.dart` using `flutter_cache_manager` for response caching.

## Core Workflows

```bash
# Fetch deps / generate iOS pods
flutter pub get
(cd ios && pod install)

# Run app (auto-selects connected simulator/device)
flutter run

# Run analyzer & tests
flutter analyze
flutter test

# Platform builds
flutter build ios
flutter build apk
```

## Architecture Cues

- `RootPage` hosts a `PageView` with 4 tabs driven by `BottomMenu`. Keep tab order in sync between `homePages` and `BottomMenu`.
- Navigation constants live in `PageRoutes`; always add new routes there and register them in `main.dart`.
- Network models (`Launch`, `CompanyInfoDto`, `Rocket`, `ApiInfoDto`) should remain immutable with `factory fromJson` constructors.
- API helpers in `spacex_api.dart` must continue to use the v3 endpoints and cached HTTP fetch pattern; prefer adding helper methods here rather than sprinkling HTTP logic through widgets.
- Loading states typically use `FutureBuilder` + `shimmer`; match this pattern for new async UI sections.

## Coding Preferences

- Follow idiomatic Dart: prefer `const` constructors/widgets, null-safe APIs, `final` for immutable locals, and extract widgets for complex UI.
- Keep widgets lean—move formatting/logic into helpers or dedicated widgets (`InfoRow`, `launchContent.dart`) when reused.
- Date/number formatting uses `intl` with `Intl.defaultLocale = 'en_US'`; align with this convention.
- Bottom navigation uses `google_nav_bar`; stick with it unless redesigning UX across files (`BottomMenu`, `RootPage`).
- When adding external links, use `url_launcher` helpers similar to `CompanyInfo` patterns.

## Platform Notes

- iOS minimum version is set in `ios/Podfile` (`platform :ios, '15.0'`). After altering iOS plugins/deps, run `pod install` inside `ios/`.
- Android project currently targets SDK 28 with Gradle 5.6.2/AGP 3.5.0; plan upgrades carefully and adjust `android/build.gradle` + wrapper in sync.

## Testing & QA

- Only `test/widget_test.dart` exists (default counter test). When touching business logic, add focused widget/unit tests under `test/`.
- Expect to run `flutter analyze` + `flutter test` before submitting significant changes.

## Known Gaps / To-Dos

1. Search tab (3rd page in `RootPage`) is a placeholder (`Text("Third tab")`). Filling it out requires API/filter UI work.
2. `LaunchesList` screen currently fetches only the latest launch; list & detail views need expansion (pagination, cards, navigation to `LaunchDetailsPage`).
3. README is still boilerplate. Consider mirroring highlights from this file for external collaborators.

## How to Extend

- New feature flow: create DTO/service updates → add widgets/screens → wire into `PageRoutes` + navigation → add loading/error handling and tests.
- Reuse `DefaultCacheManager` for any new API GETs to keep caching consistent.
- Keep styling aligned with the dark theme defined in `SpaceXApp.theme` (dark brightness, blue accents).

Refer back to this document whenever you add features or troubleshoot build issues. Update it alongside structural or workflow changes so Copilot always has fresh context.
