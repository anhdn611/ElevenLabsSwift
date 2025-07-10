#!/bin/bash

# ElvenLabs Flutter Plugin - Build and Test Script
# This script helps you build and test the plugin

set -e

echo "🚀 Starting ElvenLabs Flutter Plugin build and test..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    exit 1
fi

print_status "Flutter version: $(flutter --version | head -n 1)"

# Step 1: Get Flutter dependencies
print_status "Installing Flutter dependencies..."
flutter pub get

# Step 2: Install iOS dependencies
print_status "Installing iOS dependencies..."
cd example/ios

# Check if CocoaPods is installed
if ! command -v pod &> /dev/null; then
    print_error "CocoaPods is not installed. Please install it first:"
    print_error "sudo gem install cocoapods"
    exit 1
fi

# Install pods
pod install

cd ../..

# Step 3: Run tests
print_status "Running Flutter tests..."
flutter test

# Step 4: Build iOS
print_status "Building iOS app..."
cd example
flutter build ios --no-codesign

cd ..

# Step 5: Run on simulator (if available)
print_status "Checking for iOS simulators..."
if xcrun simctl list devices | grep -q "iPhone"; then
    print_status "Found iOS simulator. Running app..."
    cd example
    flutter run --debug
else
    print_warning "No iOS simulator found. To run on device:"
    print_warning "1. Connect your iOS device"
    print_warning "2. Run: cd example && flutter run"
fi

print_status "✅ Build and test completed successfully!"
print_status "📱 To run on physical device:"
print_status "   cd example && flutter run --release"