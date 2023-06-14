import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class CustomerListScreen extends StatefulWidget {
  @override
  _CustomerListScreenState createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  List<Map<String, dynamic>> customers = [];

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
        title: Text('Customer List'),
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return ListTile(
            title: Text(customer['name']),
            subtitle: Text(customer['email']),
            trailing: Text('Balance: \$${customer['balance']}'),
            onTap: () {
              // Navigate to the customer details screen for the selected customer
              Navigator.pushNamed(
                context,
                '/customerDetails',
                arguments: customer,
              );
            },
          );
        },
      ),
    );
  }
}
