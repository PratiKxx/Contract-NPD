import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'report.dart';
import 'watermark.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({Key? key, required this.docid}) : super(key: key);

  @override
  _editnoteState createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  late TextEditingController contno;
  late TextEditingController date;
  late TextEditingController seller;
  late TextEditingController buyer;
  late TextEditingController billingname;
  late TextEditingController gstno;
  late TextEditingController qual;
  late TextEditingController Transport;
  late TextEditingController quant;
  late TextEditingController yarn;
  late TextEditingController weight;
  late TextEditingController ratem;
  late TextEditingController delper;
  late TextEditingController PC;
  late TextEditingController brokerage;
  late TextEditingController Others;
  late TextEditingController remarks;

  @override
  void initState() {
    super.initState();

    print('widget.docid: ${widget.docid}');
    Map<String, dynamic>? data = widget.docid.data() as Map<String, dynamic>?;

    contno = TextEditingController(text: data?['Contract No'] as String? ?? '');
    date = TextEditingController(text: data?['Date'] as String? ?? '');
    seller = TextEditingController(text: data?['Seller'] as String? ?? '');
    buyer = TextEditingController(text: data?['Buyer'] as String? ?? '');
    billingname = TextEditingController(text: data?['Billing Name'] as String? ?? '');
    gstno = TextEditingController(text: data?['GST no'] as String? ?? '');
    qual = TextEditingController(text: data?['Quality'] as String? ?? '');
    Transport = TextEditingController(text: data?['Transport'] as String? ?? '');
    quant = TextEditingController(text: data?['Quantity'] as String? ?? '');
    yarn = TextEditingController(text: data?['Yarn'] as String? ?? '');
    weight = TextEditingController(text: data?['Weight'] as String? ?? '');
    ratem = TextEditingController(text: data?['Rate/m'] as String? ?? '');
    delper = TextEditingController(text: data?['Delivery Period'] as String? ?? '');
    PC = TextEditingController(text: data?['Payment Condition'] as String? ?? '');
    brokerage = TextEditingController(text: data?['Brokerage'] as String? ?? '');
    Others = TextEditingController(text: data?['Others'] as String? ?? '');
    remarks = TextEditingController(text: data?['Remarks'] as String? ?? '');

    if (data != null) {
      print('Retrieved data: $data');
    } else {
      print('Error retrieving data: Data is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 11, 133),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Home()));
            },
            child: const Text(
              "Back",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 251, 251, 251),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'Contract No': contno.text,
                'Date': date.text,
                'Seller': seller.text,
                'Buyer': buyer.text,
                'Billing Name': billingname.text,
                'GST no': gstno.text,
                'Quality': qual.text,
                'Quantity': quant.text,
                'Transport': Transport.text,
                'Yarn': yarn.text,
                'Weight': weight.text,
                'Rate/m': ratem.text,
                'Delivery Period': delper.text,
                'Payment Condition': PC.text,
                'Brokerage': brokerage.text,
                'Others': Others.text,
                'Remarks': remarks.text
              }).whenComplete(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Home()));
              });
            },
            child: const Text(
              "Save",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 251, 251, 251),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Deletion"),
                    content: const Text("Are you certain you want to delete this contract?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: const Text("No"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Delete the contract
                          widget.docid.reference.delete().whenComplete(() {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Home()));
                          });
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text(
              "Delete",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 251, 251, 251),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: contno,
                  decoration: const InputDecoration(
                    hintText: 'Contract No',
                    labelText: 'Contract No', // Set the label text
                    // floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: date,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Date',
                    labelText: 'Date',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: seller,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Seller',
                    labelText: 'Seller',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: buyer,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Buyer',
                    labelText: 'Buyer',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: billingname,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Billing Name',
                    labelText: 'Billing Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: gstno,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'GST no',
                    labelText: 'GST no',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: qual,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Quality',
                    labelText: 'Quality',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: quant,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Quality',
                    labelText: 'Quantity',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: Transport,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Transport',
                    labelText: 'Transport',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: yarn,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Yarn',
                    labelText: 'Yarn',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: weight,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Weight',
                    labelText: 'Weight',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: ratem,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Rate/m',
                    labelText: 'Rate/m',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: delper,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Delivery Period',
                    labelText: 'Delivery Period',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: PC,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Payment Condition',
                    labelText: 'Payment Condition',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: brokerage,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Brokerage',
                    labelText: 'Brokerage',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: Others,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Others',
                    labelText: 'Others',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: remarks,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Remarks',
                    labelText: 'Remarks',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: const Color.fromARGB(255, 0, 11, 133),
                onPressed: () {
                  try {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => reportt(
                          docid: widget.docid,
                          contno: contno.text,
                          date: date.text,
                          seller: seller.text,
                          buyer: buyer.text,
                          billingname: billingname.text,
                          gstno: gstno.text,
                          qual: qual.text,
                          Transport: Transport.text,
                          quant: quant.text,
                          yarn: yarn.text,
                          weight: weight.text,
                          ratem: ratem.text,
                          delper: delper.text,
                          PC: PC.text,
                          brokerage: brokerage.text,
                          Others: Others.text,
                          remarks: remarks.text,
                        ),
                      ),
                    );
                  } catch (e) {
                    print('Error navigating to editnote page: $e');
                  }
                },
                child: const Text(
                  "Convert to PDF",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 251, 251, 251),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
