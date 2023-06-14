import 'package:basic_banking_app/transaction_history.dart';
import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'home_page.dart';
import 'custome_list_screen.dart';
import 'customer_details_screen.dart';
import 'transfet_money_screen.dart';
import 'select_customer_screen.dart';
import 'transfer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create the dummy data
  await createDummyData();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/customerList': (context) => CustomerListScreen(),
        '/customerDetails': (context) =>  CustomerDetailsScreen(customerId: 1,),
        '/transferMoney': (context) => const TransferMoneyScreen(),
        '/selectCustomer': (context) => SelectCustomerScreen(sender: {},),
        '/transfers': (context) => TransfersScreen(),
        '/transactionHistoryScreen': (context) => TransactionHistoryScreen(),
        // Add routes for other screens
      },
    );
  }
}
