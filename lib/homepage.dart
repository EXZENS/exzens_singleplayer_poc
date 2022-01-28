import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //code from https://dev.to/appwrite/getting-started-with-appwrite-realtime-for-flutter-4229

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [];
  TextEditingController _nameController = TextEditingController();

  void _myTest() async {
    // Init SDK .
    Client client = Client();
    Database database = Database(client);
    client
            .setEndpoint('61f2ef3cd0f1b57ce734') // Your API Endpoint
            .setProject('61f2ef3cd0f1b57ce734') // Your project ID
        ;

    Future result = database.getDocument(
        collectionId: '61f3b4a5bf2653d177dc',
        documentId: '61f3d92c520e8c496abc');

    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlAppwrite Realtime Demo'),
      ),
      body: Center(child: Text('')),
      // body: ListView(children: [
      //   ...items.map((item) => ListTile(
      //         title: Text(item['name']),
      //       )),
      // ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _myTest,
        child: Icon(Icons.ac_unit),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     // dialog to add new item
      //     showDialog(
      //       context: context,
      //       builder: (context) => AlertDialog(
      //         title: Text('Add new item'),
      //         content: TextField(
      //           controller: _nameController,
      //         ),
      //         actions: [
      //           TextButton(
      //             child: Text('Cancel'),
      //             onPressed: () => Navigator.of(context).pop(),
      //           ),
      //           TextButton(
      //             child: Text('Add'),
      //             onPressed: () {
      //               // add new item
      //               final name = _nameController.text;
      //               if (name.isNotEmpty) {
      //                 _nameController.clear();
      //                 _addItem(name);
      //               }
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }

  void _addItem(String name) {
    setState(() {
      items.add({'name': name, 'id': DateTime.now().millisecondsSinceEpoch});
    });
  }
}
