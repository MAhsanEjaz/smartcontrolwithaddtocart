// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// class PDFScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Generate PDF'),
//           onPressed: () async {
//             // Generate the PDF
//             final pdfFile = await generatePDF();
//
//             // Open the PDF file using the OpenFile plugin
//             OpenFile.open(pdfFile.path);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// Future<File> generatePDF() async {
//   // Create a new PDF document
//   final pdf = pw.Document();
//
//   // Define a custom color palette
//   final PdfColor primaryColor = PdfColor.fromHex('#4CAF50');
//   final PdfColor secondaryColor = PdfColor.fromHex('#F44336');
//   final PdfColor tertiaryColor = PdfColor.fromHex('#3F51B5');
//
//   // Define a custom font style
//   final pw.TextStyle headerStyle = pw.TextStyle(
//     fontSize: 24,
//     color: primaryColor,
//     fontWeight: pw.FontWeight.bold,
//   );
//
//   // Add a header to the PDF document
//   pdf.addPage(
//     pw.Page(
//       build: (context) => pw.Center(
//         child: pw.Column(
//           mainAxisAlignment: pw.MainAxisAlignment.center,
//           children: [
//             pw.Text(
//               'Example PDF Document',
//               style: headerStyle,
//             ),
//             pw.SizedBox(height: 20),
//             pw.Text(
//               'This is an example PDF document created using Flutter and the pdf package.',
//               textAlign: pw.TextAlign.center,
//             ),
//             pw.SizedBox(height: 40),
//             pw.Container(
//               height: 150,
//               width: 150,
//               decoration: pw.BoxDecoration(
//                 color: secondaryColor,
//                 borderRadius: pw.BorderRadius.circular(75),
//               ),
//               child: pw.Center(
//                 child: pw.Text(
//                   'PDF',
//                   style: pw.TextStyle(
//                     fontSize: 48,
//                     color: tertiaryColor,
//                     fontWeight: pw.FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//
//   // Save the PDF document to a file
//   final file = File('example.pdf');
//   await file.writeAsBytes(await pdf.save());
//
//   return file;
// }
