// ignore_for_file: public_member_api_docs

import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp( {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text("Printing")),
        body: PdfPreview(
          build: (format) => _generatePdf(format,),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, ) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
            
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child:
                      pw.Text("Hello  Word", style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
