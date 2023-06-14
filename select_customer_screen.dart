import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SelectCustomerScreen extends StatefulWidget {
  final Map<String, dynamic>? sender;

  SelectCustomerScreen({required this.sender});

  @override
  _SelectCustomerScreenState createState() => _SelectCustomerScreenState();
}

class _SelectCustomerScreenState extends State<SelectCustomerScreen> {
  List<Map<String, dynamic>> customers = [];
  Map<String, dynamic>? selectedRecipient;

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(join(databasePath, 'bank.db'));

    final results = await database.query('users');

    setState(() {
      customers = results;
    });

    await database.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Customer'),
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return ListTile(
            title: Text(customer['name']),
            subtitle: Text(customer['email']),
            onTap: () {
              setState(() {
                selectedRecipient = customer;
              });

              Navigator.pop(context, selectedRecipient);
            },
            tileColor: selectedRecipient == customer ? Colors.blue[100] : null,
          );
        },
      ),
    );
  }
}
