# ElvenLabs Flutter Plugin

A Flutter plugin that provides integration with ElevenLabs iOS SDK for voice calling features.

## Features

- Start call using ElevenLabs SDK
- End call using ElevenLabs SDK

## Installation

### 1. Add dependency to your `pubspec.yaml`

```yaml
dependencies:
  elvenlabs_flutter:
    path: ../elvenlabs_flutter
```

### 2. Install ElevenLabs iOS SDK

The plugin requires ElevenLabs iOS SDK to be installed via CocoaPods.

#### Option A: Using CocoaPods (Recommended)

Add to your iOS project's `Podfile`:

```ruby
pod 'ElevenLabsSDK'
```

Then run:
```bash
cd ios
pod install
```

#### Option B: Manual Installation

Download the ElevenLabs iOS SDK framework and add it to your Xcode project.

### 3. Configure iOS Permissions

Add the following permissions to your `ios/Runner/Info.plist`:

```xml
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to microphone for voice calls.</string>
<key>NSCameraUsageDescription</key>
<string>This app needs access to camera for video calls.</string>
```

## Usage

```dart
import 'package:elvenlabs_flutter/elvenlabs_flutter.dart';

// Start a call
await ElvenlabsFlutter.startCall();

// End a call
await ElvenlabsFlutter.endCall();
```

## Building and Testing

### 1. Setup Development Environment

```bash
# Install Flutter dependencies
flutter pub get

# Install iOS dependencies
cd example/ios
pod install
cd ../..
```

### 2. Run on iOS Simulator

```bash
cd example
flutter run
```

### 3. Run on Physical iOS Device

```bash
cd example
flutter run --release
```

### 4. Build iOS App

```bash
cd example
flutter build ios
```

## Troubleshooting

### Common Issues

1. **Pod install fails**: Make sure you have CocoaPods installed and updated
2. **Build errors**: Check that ElevenLabs SDK is properly installed
3. **Permission errors**: Verify Info.plist permissions are correctly configured

### Debug Mode

To see debug logs from the native iOS code, run:

```bash
flutter run --debug
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.

