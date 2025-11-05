import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';

void main() {
  runApp(const DarkPdfReaderApp());
}

class DarkPdfReaderApp extends StatelessWidget {
  const DarkPdfReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark PDF Reader',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.grey,
        ),
      ),
      home: const PDFReaderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PDFReaderScreen extends StatefulWidget {
  const PDFReaderScreen({super.key});

  @override
  State<PDFReaderScreen> createState() => _PDFReaderScreenState();
}

class _PDFReaderScreenState extends State<PDFReaderScreen> {
  String? _pdfPath;
  String _fileName = 'No PDF loaded';

  Future<void> _pickPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: false,
        withReadStream: true,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _pdfPath = result.files.single.path;
          _fileName = result.files.single.name;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Dark PDF Reader'),
      ),
      body: Column(
        children: [
          // Toolbar
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFF1A1A1A),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickPDF,
                  icon: const Icon(Icons.folder_open),
                  label: const Text('Open PDF'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Tooltip(
                    message: _fileName,
                    child: Text(
                      _fileName,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          // PDF Viewer
          Expanded(
            child: _pdfPath == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.picture_as_pdf,
                          size: 80,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'No PDF loaded',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Click "Open PDF" to load a document',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.black,
                    child: ColorFiltered(
                      // Invert colors for dark mode
                      colorFilter: const ColorFilter.matrix([
                        -1, 0, 0, 0, 255,  // Red channel inverted
                        0, -1, 0, 0, 255,  // Green channel inverted
                        0, 0, -1, 0, 255,  // Blue channel inverted
                        0, 0, 0, 1, 0,     // Alpha channel unchanged
                      ]),
                      child: SfPdfViewer.file(
                        File(_pdfPath!),
                        canShowScrollHead: true,
                        canShowScrollStatus: true,
                        enableDoubleTapZooming: true,
                        enableTextSelection: false,
                        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                          // PDF loaded successfully
                        },
                        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to load PDF'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

