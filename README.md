# 🌙 Dark PDF Reader for macOS

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-10.14+-000000?style=for-the-badge&logo=apple&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A beautiful, eye-friendly dark mode PDF reader built with Flutter for macOS**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Building](#-building) • [Contributing](#-contributing)

</div>

---

## 📖 About

Dark PDF Reader is a modern, native macOS application designed for comfortable PDF reading in low-light environments. Built with Flutter, it provides a sleek dark interface with automatic color inversion for PDF content, making it perfect for nighttime reading or reducing eye strain.

### Why Dark PDF Reader?

- ✅ **Eye-Friendly**: Dark mode reduces eye strain during extended reading sessions
- ✅ **Native Performance**: Built with Flutter for smooth, native-like performance
- ✅ **Simple & Clean**: Minimalist interface focused on reading
- ✅ **Free & Open Source**: MIT licensed, free to use and modify

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 📄 **PDF Viewing** | Smooth rendering with Syncfusion PDF Viewer |
| 🌙 **Dark Mode** | Beautiful dark interface with inverted PDF content |
| 🔍 **Zoom Support** | Double-tap to zoom, pinch to zoom |
| 📂 **Easy File Access** | Native macOS file picker integration |
| 🎨 **Modern UI** | Clean Material Design dark theme |
| ⚡ **Performance** | Optimized for large PDF files |
| 💾 **Memory Efficient** | Efficient PDF handling and rendering |
| 📱 **Responsive** | Adapts to different window sizes |

---

## 🖼️ Screenshots

<div align="center">

*Screenshots coming soon!*

<!-- Add your screenshots here -->
<!-- ![Screenshot 1](screenshots/screenshot1.png) -->
<!-- ![Screenshot 2](screenshots/screenshot2.png) -->

</div>

---

## 📋 Requirements

### Development Requirements

- **Flutter SDK**: 3.0.0 or later
- **Dart SDK**: 3.0.0 or later
- **macOS**: 10.14 (Mojave) or later
- **Xcode**: 14.0 or later (for building)
- **CocoaPods**: Latest version (for iOS/macOS dependencies)

### Runtime Requirements

- **macOS**: 10.14 (Mojave) or later
- **Minimum RAM**: 4GB (8GB recommended)
- **Disk Space**: ~50MB for the application

---

## 🚀 Installation

### Prerequisites

1. **Install Flutter**

   ```bash
   # macOS
   brew install --cask flutter
   
   # Or download from https://flutter.dev/docs/get-started/install/macos
   ```

2. **Verify Installation**

   ```bash
   flutter doctor
   ```

3. **Install Xcode** (if not already installed)

   ```bash
   # Install from App Store or
   xcode-select --install
   ```

### Clone and Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/bargo123/DarkPdfReader.git
   cd DarkPdfReader
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   # Debug mode
   flutter run -d macos
   
   # Profile mode (recommended for testing)
   flutter run -d macos --profile
   
   # Or use the run script
   ./run.sh
   ```

---

## 💻 Usage

### Running the Application

#### Quick Start (Using Script)

```bash
# Default (Profile mode)
./run.sh

# Profile mode
./run_profile.sh

# Release mode
./run_release.sh
```

#### Manual Run

```bash
# Debug mode
flutter run -d macos

# Profile mode (better performance)
flutter run -d macos --profile

# Release mode (maximum performance)
flutter run -d macos --release
```

### Using the App

1. **Launch** the application
2. **Click** the "Open PDF" button in the toolbar
3. **Select** a PDF file from the file picker
4. **Read** your PDF in beautiful dark mode!
5. **Zoom** by double-tapping or pinching
6. **Scroll** through pages naturally

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Cmd + O` | Open PDF file |
| `Cmd + W` | Close window |
| `Cmd + Q` | Quit application |

---

## 🔨 Building

### Build for Release

```bash
# Build the macOS app
flutter build macos --release

# The app will be in:
# build/macos/Build/Products/Release/dark_pdf_reader.app
```

### Create DMG (Optional)

To create a distributable DMG file:

```bash
# Install create-dmg
brew install create-dmg

# Create DMG
create-dmg \
  --volname "Dark PDF Reader" \
  --volicon "assets/icon.icns" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "dark_pdf_reader.app" 200 190 \
  --hide-extension "dark_pdf_reader.app" \
  --app-drop-link 600 185 \
  "DarkPDFReader.dmg" \
  "build/macos/Build/Products/Release/"
```

---

## 📁 Project Structure

```
DarkPdfReader/
├── lib/
│   └── main.dart              # Main application entry point
├── macos/                     # macOS platform-specific code
│   ├── Runner/
│   │   ├── AppDelegate.swift   # macOS app delegate
│   │   └── MainFlutterWindow.swift
│   └── Flutter/
│       └── GeneratedPluginRegistrant.swift
├── test/                      # Unit tests
├── assets/                     # Assets (icons, images)
├── pubspec.yaml               # Flutter dependencies and metadata
├── README.md                  # This file
├── LICENSE                    # MIT License
├── run.sh                     # Run script (Profile mode)
├── run_profile.sh            # Profile mode script
└── run_release.sh             # Release mode script
```

---

## 📦 Dependencies

### Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `syncfusion_flutter_pdfviewer` | ^24.1.41 | PDF rendering and viewing |
| `file_picker` | ^6.1.1 | Native file selection dialog |
| `path_provider` | ^2.1.1 | File system path utilities |

### Development Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_test` | SDK | Testing framework |
| `flutter_lints` | ^3.0.0 | Linting rules |

---

## 🔧 How It Works

### Architecture

The application uses a simple, clean architecture:

1. **UI Layer**: Flutter Material Design with dark theme
2. **PDF Rendering**: Syncfusion PDF Viewer for native PDF rendering
3. **Color Inversion**: ColorFiltered widget with color matrix to invert PDF colors
4. **File Selection**: File Picker plugin for native macOS file dialogs

### Color Inversion

The app uses Flutter's `ColorFiltered` widget with a color matrix to invert PDF colors:

```dart
ColorFilter.matrix([
  -1, 0, 0, 0, 255,  // Red channel inverted
  0, -1, 0, 0, 255,  // Green channel inverted
  0, 0, -1, 0, 255,  // Blue channel inverted
  0, 0, 0, 1, 0,     // Alpha channel unchanged
])
```

This converts:
- White backgrounds → Black
- Black text → White
- All colors are inverted for dark mode viewing

---

## 🐛 Troubleshooting

### Common Issues

#### Build Errors

**Problem**: `flutter build macos` fails

**Solutions**:
```bash
# Clean build
flutter clean
flutter pub get

# Update dependencies
flutter pub upgrade

# Check Flutter version
flutter --version

# Verify setup
flutter doctor -v
```

#### PDF Not Loading

**Problem**: PDF files won't open

**Solutions**:
- Verify the file is a valid PDF
- Check file permissions
- Try a different PDF file
- Ensure you have read access to the file location

#### App Crashes

**Problem**: App crashes on launch

**Solutions**:
```bash
# Rebuild with clean
flutter clean
flutter pub get
flutter run -d macos

# Check logs
flutter logs
```

#### Performance Issues

**Problem**: App is slow with large PDFs

**Solutions**:
- Run in profile mode: `flutter run -d macos --profile`
- Build release version: `flutter build macos --release`
- Close other applications to free memory

---

## 🤝 Contributing

Contributions are welcome and greatly appreciated! Here's how you can help:

### How to Contribute

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Development Guidelines

- Follow Flutter style guidelines
- Write meaningful commit messages
- Add comments for complex code
- Test your changes before submitting
- Update documentation as needed

### Reporting Issues

If you find a bug or have a feature request:

1. Check existing issues first
2. Create a new issue with:
   - Clear title and description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Screenshots if applicable

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Dark PDF Reader

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🙏 Acknowledgments

- **Flutter Team** - For the amazing cross-platform framework
- **Syncfusion** - For the excellent PDF viewer package
- **File Picker Contributors** - For the file picker plugin
- **Open Source Community** - For inspiration and support

---

## 👤 Author

**bargo123**

- GitHub: [@bargo123](https://github.com/bargo123)
- Project Link: [https://github.com/bargo123/DarkPdfReader](https://github.com/bargo123/DarkPdfReader)

---

## 📊 Project Status

![GitHub stars](https://img.shields.io/github/stars/bargo123/DarkPdfReader?style=social)
![GitHub forks](https://img.shields.io/github/forks/bargo123/DarkPdfReader?style=social)
![GitHub issues](https://img.shields.io/github/issues/bargo123/DarkPdfReader)
![GitHub pull requests](https://img.shields.io/github/issues-pr/bargo123/DarkPdfReader)

---

## ⭐ Show Your Support

If you find this project useful, please consider:

- ⭐ **Starring** the repository
- 🐛 **Reporting** bugs
- 💡 **Suggesting** new features
- 🔧 **Contributing** code
- 📢 **Sharing** with others

---

<div align="center">

**Made with ❤️ using Flutter**

[⬆ Back to Top](#-dark-pdf-reader-for-macos)

</div>
# DarkPdfReader
