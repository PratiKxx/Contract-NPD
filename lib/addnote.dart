import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'watermark.dart';
import 'main.dart';

class addnote extends StatefulWidget {
  addnote({Key? key}) : super(key: key);

  @override
  _addnoteState createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  TextEditingController contno = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController seller = TextEditingController();
  TextEditingController buyer = TextEditingController();
  TextEditingController billingname = TextEditingController();
  TextEditingController gstno = TextEditingController();
  TextEditingController qual = TextEditingController();
  TextEditingController Transport = TextEditingController();
  TextEditingController quant = TextEditingController();
  TextEditingController yarn = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController ratem = TextEditingController();
  TextEditingController delper = TextEditingController();
  TextEditingController PC = TextEditingController();
  TextEditingController brokerage = TextEditingController();
  TextEditingController Others = TextEditingController();
  TextEditingController remarks = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('report');

  @override
  void initState() {
    super.initState();
    // Set the initial value of the 'date' controller to the current date
    setDate();
    getContractCount();
  }

  void setDate() {
    // Get the current date
    DateTime now = DateTime.now();

    // Format the date as DD/MM/YYYY
    String formattedDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";

    // Set the formatted date to the 'date' controller
    date.text = formattedDate;
  }

  Future<void> getContractCount() async {
    // Get the count of existing contracts
    QuerySnapshot querySnapshot = await ref.get();
    int contractCount = querySnapshot.size + 1; // Increment by 1 for the new contract

    // Set the next contract number to the 'contno' controller
    contno.text = contractCount.toString();
  }

  Future<bool> isContractNoExists(String contractNo) async {
    QuerySnapshot querySnapshot = await ref.where('Contract No', isEqualTo: contractNo).get();
    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 11, 133),
        actions: [
          MaterialButton(
            onPressed: () async {
              // Check if the Contract No field is not empty
              if (contno.text.isNotEmpty) {
                // Check if the contract number already exists
                bool contractExists = await isContractNoExists(contno.text);

                if (contractExists) {
                  // Show a message if Contract No already exists
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('This Contract No already exists.'),
                    ),
                  );
                } else {
                  // Add the data to Firestore
                  ref.add({
                    'Contract No': contno.text,
                    'Date': date.text,
                    'Seller': seller.text,
                    'Buyer': buyer.text,
                    'Billing Name': billingname.text,
                    'GST no': gstno.text,
                    'Quality': qual.text,
                    'Transport': Transport.text,
                    'Quantity': quant.text,
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
                }
              } else {
                // Show a message if Contract No is not filled
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Contract No cannot be empty.'),
                  ),
                );
              }
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                controller: contno,
                keyboardType: TextInputType.number,
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
                decoration: const InputDecoration(
                  hintText: 'Quantity',
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
                decoration: const InputDecoration(
                  hintText: 'Remarks',
                  labelText: 'Remarks',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
