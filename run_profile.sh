#!/bin/bash

# Run Dark PDF Reader in Profile Mode

echo "🚀 Starting Dark PDF Reader in Profile Mode..."
echo "Profile mode provides performance optimizations while still allowing debugging."
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

# Run the app in profile mode
echo ""
echo "🎨 Launching Dark PDF Reader in Profile Mode..."
flutter run -d macos --profile

