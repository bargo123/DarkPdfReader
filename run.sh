#!/bin/bash

# Quick run script for Dark PDF Reader

echo "🚀 Starting Dark PDF Reader..."
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

# Run the app
echo ""
echo "🎨 Launching Dark PDF Reader in profile mode..."
flutter run -d macos --profile

