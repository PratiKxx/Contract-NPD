import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
            marginBottom: 9,
            marginLeft: 9,
            marginRight: 9,
            marginTop: 9,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return pw.Container(
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                left: pw.BorderSide(
                  width: 4.0,
                  color: PdfColors.black,
                ),
                right: pw.BorderSide(
                  width: 4.0,
                  color: PdfColors.black,
                ),
                top: pw.BorderSide(
                  width: 4.0,
                  color: PdfColors.black,
                ),
                bottom: pw.BorderSide(
                  width: 4.0,
                  color: PdfColors.black,
                ),
              ),
            ),
            padding: const pw.EdgeInsets.all(10),
            child: pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 2.0, color: PdfColors.black),
              ),
              padding: const pw.EdgeInsets.all(10.0),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        'NARESHKUMAR P DAGA',
                        style: pw.TextStyle(
                          fontSize: 35,
                          fontWeight: pw.FontWeight.bold,
                          fontStyle: pw.FontStyle.italic,
                          font: pw.Font.helveticaBold(),
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
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        'C/O Parasmal Sureshkumar Daga Hulgeshwari rd. Ichalkaranji',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          // fontStyle: pw.FontStyle.italic,
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
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          //fontStyle: pw.FontStyle.italic,
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
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        ' ALL TYPES OF GREY FABRIC COMMISSION AGENT',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          fontStyle: pw.FontStyle.italic,
                          font: pw.Font.courierBold(),
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
                  pw.SizedBox(height: 15),
                  pw.Divider(),
                  pw.SizedBox(height: 5),
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
                      pw.SizedBox(width: 140), // Add some space between Contract No and Date
                      pw.Text(
                        'Date: ',
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
                  pw.SizedBox(height: 5),
                  pw.Divider(),
                  pw.SizedBox(height: 15),

                  // pw.Row(
                  //   mainAxisAlignment: pw.MainAxisAlignment.start,
                  //   children: [
                  //     pw.Text(
                  //       '   Date: ',
                  //       style: pw.TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: pw.FontWeight.bold,
                  //       ),
                  //     ),
                  //     pw.Text(
                  //       widget.date,
                  //       style: const pw.TextStyle(
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Seller: ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.seller,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Buyer: ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.buyer,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Billing Name : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.billingname,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' GST no : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.gstno,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Quality : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.qual,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Quantity : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.quant,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Rate/m : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.ratem,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Yarn : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.yarn,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Weight : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.weight,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Transport : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.Transport,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Delivery : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.delper,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Payment : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.PC,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Brokerage : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.brokerage,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Others : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.Others,
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        ' Remarks : ',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        widget.remarks,
                        style: const pw.TextStyle(
                          fontSize: 20,
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
                        '1. Please mention the above Contract no COMPULSORILY in the bill',
                        style: pw.TextStyle(
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
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
                        '4. Subject to ichalkaranji Jurisdiction ONLY.',
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
                        'Application Developed By Pratik N Daga | 9172661505',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: const PdfColor.fromInt(0xFF808080),
                          fontStyle: pw.FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    return doc.save();
  }
}
