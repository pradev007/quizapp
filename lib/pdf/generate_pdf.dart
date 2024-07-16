// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:io';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class GeneratePdf {
  Future<void> generatePdf(BuildContext context) async {
    final myPdf = pw.Document();
    myPdf.addPage(pw.Page(
      build: (context) {
        return pw.Column(children: [
          pw.Row(children: [
            pw.Header(text: 'About pdf tables and more'),
          ]),
        ]);
      },
    ));
    // Save the PDF document to a byte array.
    try {
      // Get the external storage directory
      final directory = await getExternalStorageDirectory();
      final downloadsDir = Directory('${directory?.path}/Download');

      if (!downloadsDir.existsSync()) {
        await downloadsDir.create(recursive: true);
      }

      final pdfBytes = await myPdf.save();

      await DocumentFileSavePlus().saveFile(
        pdfBytes,
        "example.pdf",
        "application/pdf",
      );

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF saved successfully.'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving PDF: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
