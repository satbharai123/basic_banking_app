import 'package:basic_banking_app/transfet_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CustomerDetailsScreen extends StatefulWidget {
  final int customerId;

  const CustomerDetailsScreen({Key? key, required this.customerId}) : super(key: key);

  @override
  _CustomerDetailsScreenState createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  Map<String, dynamic>? customer;

  @override
  void initState() {
    super.initState();
    fetchCustomerDetails();
  }

  Future<void> fetchCustomerDetails() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(join(databasePath, 'bank.db'));

    final results = await database.query(
      'users',
      where: 'id = ?',
      whereArgs: [widget.customerId],
    );

    if (results.isNotEmpty) {
      setState(() {
        customer = results.first;
      });
    }

    await database.close();
  }
  void transferMoney() {
      // Navigate to the transfer screen and pass the necessary data
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(
          builder: (context) => const TransferMoneyScreen(),
        ),
      );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: customer != null
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200,),
              Text('Name: ${customer!['name']}',style: TextStyle(fontSize: 28),),
              Text('Email: ${customer!['email']}',style: TextStyle(fontSize: 28),),
              Text('Current Balance: \$${customer!['balance']}',style: TextStyle(fontSize: 28),),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransferMoneyScreen(),));
                },
                child: const Text('Transfer Money'),
              ),
            ],
          )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
