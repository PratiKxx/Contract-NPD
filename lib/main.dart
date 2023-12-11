  
  // class Home extends StatefulWidget {
  //   const Home({super.key});

  //   @override
  //   _HomeState createState() => _HomeState();
  // }

  // class _HomeState extends State<Home> {
  //   final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
  //     FirebaseFirestore.instance.collection('report').snapshots();
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       floatingActionButton: FloatingActionButton(
  //         backgroundColor: const Color.fromARGB(255, 0, 11, 133),
  //         onPressed: () {
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (_) => addnote()));
  //         },
  //         child: const Icon(
  //           Icons.add,
  //           color: Colors.white,
  //         ),
  //       ),
  //       appBar: AppBar(
  //         backgroundColor: const Color.fromARGB(255, 0, 11, 133),
  //         // title: const Text('Contracts'),
  //         title: const Text(
  //   'Contracts',
  //   style: TextStyle(
  //     color: Colors.white,
  //   ),
  // ),

  //       ),
  //       body: Stack(
  //         children: [ 
  //       StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  //   stream: _usersStream,
  //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
  //     if (snapshot.hasError) {
  //       return const Text("Something is wrong");
  //     }
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     }

  //     return ListView.builder(
  //   itemCount: snapshot.data!.docs.length,
  //   itemBuilder: (_, index) {
  //     // Extracting data from the document
  //     Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;

  //     // Sorting the data based on the "Contract No" field
  //     List<Map<String, dynamic>> sortedData = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  //     sortedData.sort((a, b) => b['Contract No'].compareTo(a['Contract No']));

  //     return GestureDetector(
  //       onTap: () {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (_) => editnote(docid: snapshot.data!.docs[index]),
  //           ),
  //         );
  //       },
  //       child: Column(
  //         children: [
  //           const SizedBox(
  //             height: 4,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(
  //               left: 3,
  //               right: 3,
  //             ),
  //             child: ListTile(
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //                 side: const BorderSide(
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               title: Text(
  //                 'Contract No: ${sortedData[index]['Contract No']}',
  //                 style: const TextStyle(
  //                   fontSize: 20,
  //                 ),
  //               ),
  //               subtitle: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text('Date : ${sortedData[index]['Date']}'),
  //                   Text('Buyer: ${sortedData[index]['Buyer']}'),
  //                   Text('Seller: ${sortedData[index]['Seller']}'),
  //                   // Add more fields as needed
  //                 ],
  //               ),
  //               contentPadding: const EdgeInsets.symmetric(
  //                 vertical: 12,
  //                 horizontal: 16,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   },
  // );

  //   },
  // ),
  //       Watermark(),
  //         ],
  //       ),
  //     );
  //   }
  // }
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'watermark.dart';

import 'addnote.dart';
import 'editnote.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Student report",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 0, 11, 133),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance.collection('report').snapshots();

  // Filtered data to display based on search
  List<Map<String, dynamic>> filteredData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 11, 133),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => addnote()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 0, 11, 133),
  title: const Text(
    'Contracts',
    style: TextStyle(
      color: Colors.white,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white, // Change the color here
  ),
  actions: [
    // Search bar in the AppBar
    IconButton(
      icon: const Icon(Icons.search),
      color: Colors.white,
      onPressed: () async {
        final String? result = await showSearch<String>(
          context: context,
          delegate: DataSearch(filteredData),
        );

        if (result != null) {
          // Perform actions based on the search result if needed
          print('Search result: $result');
        }
      },
    ),
  ],
),

      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _usersStream,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something is wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // Extracting data from the documents
              List<Map<String, dynamic>> data =
                  snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

              // Sort the data based on the "Contract No" field in descending order
              data.sort((a, b) => int.parse(b['Contract No']).compareTo(int.parse(a['Contract No'])));


              // Set filtered data to display based on the search
              filteredData = data;

              return ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (_, index) {
          Map<String, dynamic> report = filteredData[index];

          return GestureDetector(
  onTap: () {
    String contractNo = report['Contract No'] ?? '';

    if (contractNo.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('report')
          .where('Contract No', isEqualTo: contractNo)
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          // Assuming Contract No is unique; if not, you may need to handle multiple docs
          DocumentSnapshot doc = querySnapshot.docs.first;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => editnote(docid: doc),
            ),
          );
        } else {
          print('Document does not exist for Contract No: $contractNo');
        }
      }).catchError((error) {
        print('Error retrieving document: $error');
      });
    } else {
      print('Contract No is empty or null.');
    }
  },


                    child: Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 3,
                            right: 3,
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              'Contract No: ${report['Contract No']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date : ${report['Date']}'),
                                Text('Buyer: ${report['Buyer']}'),
                                Text('Seller: ${report['Seller']}'),
                                // Add more fields as needed
                              ],
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Watermark(),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<Map<String, dynamic>> data;

  DataSearch(this.data);

  @override
List<Widget> buildActions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.clear, color: Colors.white),
      onPressed: () {
        query = '';
      },
    ),
  ];
}

  @override
Widget buildLeading(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      close(context, '');
    },
  );
}

  @override
  Widget buildResults(BuildContext context) {
    // Implement the UI for the search results here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, dynamic>> suggestionList = query.isEmpty
        ? data
        : data
            .where((report) =>
                report['Buyer'].toString().toLowerCase().contains(query.toLowerCase()) ||
                report['Seller'].toString().toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> report = suggestionList[index];

        return ListTile(
          title: Text(
            'Contract No: ${report['Contract No']}',
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date : ${report['Date']}'),
              Text('Buyer: ${report['Buyer']}'),
              Text('Seller: ${report['Seller']}'),
              // Add more fields as needed
            ],
          ),
          onTap: () {
  String contractNo = report['Contract No'] as String;
  if (contractNo.isNotEmpty) {
    FirebaseFirestore.instance.collection('report')
        .where('Contract No', isEqualTo: contractNo)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming Contract No is unique; if not, you may need to handle multiple docs
        DocumentSnapshot doc = querySnapshot.docs.first;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => editnote(docid: doc),
          ),
        );
      } else {
        print('Document does not exist for Contract No: $contractNo');
      }
    }).catchError((error) {
      print('Error retrieving document: $error');
    });
  } else {
    print('Contract No is empty or null.');
  }
},

        );
      },
    );
  }
}
