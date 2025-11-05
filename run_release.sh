#!/bin/bash

# Run Dark PDF Reader in Release Mode

echo "🚀 Starting Dark PDF Reader in Release Mode..."
echo "Release mode provides maximum performance optimizations."
echo ""

cd "$(dirname "$0")"

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed!"
    echo "Please install Flutter from: https://flutter.dev"
    exit 1
fi

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Run the app in release mode
echo ""
echo "🎨 Launching Dark PDF Reader in Release Mode..."
flutter run -d macos --release

