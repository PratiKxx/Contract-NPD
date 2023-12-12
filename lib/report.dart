// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:cloud_firestore/cloud_firestore.dart';

// class reportt extends StatefulWidget {
//   DocumentSnapshot docid;
//   String contno, date, seller, buyer, billingname, gstno, qual, Transport, quant, yarn,
//       weight, ratem, delper, PC, brokerage, Others, remarks;

//   reportt({
//     required this.docid,
//     required this.contno,
//     required this.date,
//     required this.seller,
//     required this.buyer,
//     required this.billingname,
//     required this.gstno,
//     required this.qual,
//     required this.Transport,
//     required this.quant,
//     required this.yarn,
//     required this.weight,
//     required this.ratem,
//     required this.delper,
//     required this.PC,
//     required this.brokerage,
//     required this.Others,
//     required this.remarks,
//   });

//   @override
//   State<reportt> createState() => _reporttState();
// }

// class _reporttState extends State<reportt> {
//   late final pdf = pw.Document();

//   @override
//   Widget build(BuildContext context) {
//     return PdfPreview(
//       build: (format) => generateDocument(format),
//     );
//   }

//   Future<Uint8List> generateDocument(PdfPageFormat format) async {
//     final doc = pw.Document(pageMode: PdfPageMode.outlines);

//     final font1 = pw.Font.helvetica();
//     final font2 = pw.Font.helveticaBold();

//     doc.addPage(
//       pw.Page(
//         pageTheme: pw.PageTheme(
//           pageFormat: format.copyWith(
//             marginBottom: 0,
//             marginLeft: 0,
//             marginRight: 0,
//             marginTop: 0,
//           ),
//           orientation: pw.PageOrientation.portrait,
//           theme: pw.ThemeData.withFont(
//             base: font1,
//             bold: font2,
//           ),
//         ),
//         build: (context) {
//           return pw.Center(
//             child: pw.Column(
//               mainAxisAlignment: pw.MainAxisAlignment.center,
//               children: [
//                 pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.center,
//                   children: [
//                     pw.Divider(),
//                     pw.Text(
//                       'Contract No : ',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Text(
//                       widget.contno,
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.center,
//                   children: [
//                     pw.Text(
//                       'Date: ',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Text(
//                       widget.date,
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.center,
//                   children: [
//                     pw.Text(
//                       'Seller: ',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Text(
//                       widget.seller,
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.center,
//                   children: [
//                     pw.Text(
//                       'Buyer: ',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Text(
//                       widget.buyer,
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Billing Name : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.billingname,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'GST no : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.gstno,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Quality : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.qual,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Quantity : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.quant,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Transport : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.Transport,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Yarn : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.yarn,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Weight : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.weight,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Rate/m : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.ratem,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Delivery Period : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.delper ,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Payment Condition : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.PC,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Brokerage : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.brokerage,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Others : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.Others,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Remarks : ',
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   pw.Text(
//                     widget.remarks,
//                     style: pw.TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//               pw.Divider(),
//               pw.SizedBox(height: 40),
//               pw.Text(
//                       '1. Above goods is sold under the section of Cloth Association.',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Text(
//                       '2. All Rules and Regulation has to be accepted by bothe parties.',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Text(
//                       '3. Contract goods cannot be cancelled in any condition.',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Text(
//                       '4. Subject to ichalkaranji Jurisdiction.',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     pw.Divider() ,
//                     pw.SizedBox(height: 40),

//                     pw.Text(
//                       'Developed By Pratik Nareshkumar Daga',
//                       style: pw.TextStyle(
//                         fontSize: 20,
//                         fontWeight: pw.FontWeight.bold,
//                       ),
//                     ),
//               ],
//             ),
//           );
//         },

//       ),
//     );

//     return doc.save();
//   }
// }
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';

class reportt extends StatefulWidget {
  DocumentSnapshot docid;
  String contno,
      date,
      seller,
      buyer,
      billingname,
      gstno,
      qual,
      Transport,
      quant,
      yarn,
      // ignore: non_constant_identifier_names
      weight,
      ratem,
      delper,
      PC,
      brokerage,
      Others,
      remarks;

  // ignore: use_key_in_widget_constructors
  reportt({
    required this.docid,
    required this.contno,
    required this.date,
    required this.seller,
    required this.buyer,
    required this.billingname,
    required this.gstno,
    required this.qual,
    required this.Transport,
    required this.quant,
    required this.yarn,
    required this.weight,
    required this.ratem,
    required this.delper,
    // ignore: non_constant_identifier_names
    required this.PC,
    required this.brokerage,
    required this.Others,
    required this.remarks,
  });

  @override
  State<reportt> createState() => _reporttState();
}

// ignore: camel_case_types
class _reporttState extends State<reportt> {
  late final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => generateDocument(format),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final font1 = pw.Font.helvetica();
    final font2 = pw.Font.helveticaBold();

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 15,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'NARESHKUMAR P DAGA',
                    style: pw.TextStyle(
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                    ),
                    // ),
                    // pw.Text(
                    //   widget.date,
                    //   style: pw.TextStyle(
                    //     fontSize: 20,
                    //   ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'C/O Parasmal Sureshkumar Daga Hulgeshwari rd. Ichalkaranji',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                    ),
                    // ),
                    // pw.Text(
                    //   widget.date,
                    //   style: pw.TextStyle(
                    //     fontSize: 20,
                    //   ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    ' 9373275765 | 9423275765(w) | pnareshdaga@gmail.com ',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                    ),
                    // ),
                    // pw.Text(
                    //   widget.date,
                    //   style: pw.TextStyle(
                    //     fontSize: 20,
                    //   ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    ' ALL TYPES OF GREY FABRIC COMMISSION AGENT',
                    style: pw.TextStyle(
                      fontSize: 20,
                      // fontWeight: pw.FontWeight.bold,
                      fontStyle: pw.FontStyle.italic,
                    ),
                    // ),
                    // pw.Text(
                    //   widget.date,
                    //   style: pw.TextStyle(
                    //     fontSize: 20,
                    //   ),
                  ),
                ],
              ),
              pw.SizedBox(height: 1),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Divider(),
                  pw.Text(
                    '   Contract No : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.contno,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Date: ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.date,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Seller: ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.seller,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Buyer: ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.buyer,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Billing Name : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.billingname,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   GST no : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.gstno,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Quality : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.qual,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Quantity : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.quant,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Rate/m : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.ratem,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Yarn : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.yarn,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Weight : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.weight,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Transport : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.Transport,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),

              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Delivery Period : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.delper,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Payment Condition : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.PC,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Brokerage : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.brokerage,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Others : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.Others,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '   Remarks : ',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    widget.remarks,
                    style: const pw.TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '1. Above goods is sold under the section of Cloth Association.',
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  // pw.Text(
                  //   widget.remarks,
                  //   style: const pw.TextStyle(
                  //     fontSize: 20,
                  //   ),
                  // ),
                ],
              ),
              // pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '2. All Rules and Regulation has to be accepted by bothe parties.',
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  // pw.Text(
                  //   widget.remarks,
                  //   style: const pw.TextStyle(
                  //     fontSize: 20,
                  //   ),
                  // ),
                ],
              ),
              // pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '3. Contract goods cannot be cancelled in any condition.',
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  // pw.Text(
                  //   widget.remarks,
                  //   style: const pw.TextStyle(
                  //     fontSize: 20,
                  //   ),
                  // ),
                ],
              ),
              // pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    '4. Subject to ichalkaranji Jurisdiction.',
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  // pw.Text(
                  //   widget.remarks,
                  //   style: const pw.TextStyle(
                  //     fontSize: 20,
                  //   ),
                  // ),
                ],
              ),
              pw.SizedBox(height: 5),
              pw.Divider(),

              // Bottom text
              pw.Expanded(
                child: pw.Container(
                  alignment: pw.Alignment.bottomCenter,
                  child: pw.Text(
                    'Developed By Pratik Nareshkumar Daga | 9172661505',
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      color: const PdfColor.fromInt(0xFF808080),
                      fontStyle: pw.FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    return doc.save();
  }
}
