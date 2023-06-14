import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TransfersScreen extends StatefulWidget {
  @override
  _TransfersScreenState createState() => _TransfersScreenState();
}

class _TransfersScreenState extends State<TransfersScreen> {
  List<Map<String, dynamic>> transfers = [];

  @override
  void initState() {
    super.initState();
    fetchTransfers();
  }

  Future<void> fetchTransfers() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(join(databasePath, 'bank.db'));

    final results = await database.query('transfers');

    setState(() {
      transfers = results;
    });

    await database.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfers'),
      ),
      body: Center(
       child: Column(
         children: [
           SizedBox(
             height: 50,
           ),
           Image(image: AssetImage("assets/images/success.jpg")),

         ],
       ),
      )
    );

}}
