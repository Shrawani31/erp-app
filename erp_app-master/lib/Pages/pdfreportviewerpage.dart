import 'dart:io';

import 'package:erp_app/controllers/OutstandingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_file/internet_file.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class PdfReportViewerPage extends StatefulWidget {
  PdfReportViewerPage({Key? key, this.pdfUrl, this.reportName})
      : super(key: key);
  final String? pdfUrl;
  final String? reportName;

  @override
  State<PdfReportViewerPage> createState() => _PdfReportViewerPageState();
}

class _PdfReportViewerPageState extends State<PdfReportViewerPage> {
  static const int _initialPage = 1;
  late PdfController _pdfController;

  bool loaded = false;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openData(InternetFile.get(widget.pdfUrl!)),
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  Future<String> _downloadFile(String url, String filename) async {
    http.Client client = new http.Client();
    var req = await http.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00897B),
          titleSpacing: BorderSide.strokeAlignInside,
          title: Text(
            "Report",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: PdfView(
          builders: PdfViewBuilders<DefaultBuilderOptions>(
            options: const DefaultBuilderOptions(),
            documentLoaderBuilder: (_) =>
                const Center(child: CircularProgressIndicator()),
            pageLoaderBuilder: (_) =>
                const Center(child: CircularProgressIndicator()),
          ),
          controller: _pdfController,
        ),
        floatingActionButton: Container(
          color: Color(0xFF00897B),
          height: 50,
          width: MediaQuery.of(context).size.width - 35,
          child: InkWell(
            onTap: () async {
              String filePath =
                  await _downloadFile(widget.pdfUrl!, "Report_file.pdf");
              Share.shareXFiles([XFile(filePath)], text: 'OutStanding Reports');
              // Share.share('check out Report ${widget.pdfUrl}');
            },
            child: const Center(
                child: Text(
              "Share",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ));
  }
}
