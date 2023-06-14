import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banking App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the customer list screen
                Navigator.pushNamed(context, '/customerList');
              },
              child: Text('View All Customers'),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                // Navigate to the customer list screen
                Navigator.pushNamed(context, '/transactionHistoryScreen');
              },
              child: Text('Transaction History'),
            ),
          ],
        ),
      ),
    );
  }
}
