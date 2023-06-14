import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> createDummyData() async {
  // Open the database
  final databasePath = await getDatabasesPath();
  final database = await openDatabase(join(databasePath, 'bank.db'));

  // Create the users table
  await database.execute('''
    CREATE TABLE IF NOT EXISTS users (
      id INTEGER PRIMARY KEY,
      name TEXT,
      email TEXT,
      balance REAL
    )
  ''');

  // Insert dummy data for users
  final users = [
    {'name': 'John Doe', 'email': 'john@example.com', 'balance': 5000.0},
    {'name': 'Jane Smith', 'email': 'jane@example.com', 'balance': 3000.0},
    {'name': 'Michael Johnson', 'email': 'michael@example.com', 'balance': 7000.0},
    {'name': 'Emily Davis', 'email': 'emily@example.com', 'balance': 2000.0},
    {'name': 'David Wilson', 'email': 'david@example.com', 'balance': 4000.0},
    {'name': 'Emma Anderson', 'email': 'emma@example.com', 'balance': 6000.0},
    {'name': 'Daniel Martinez', 'email': 'daniel@example.com', 'balance': 5500.0},
    {'name': 'Olivia Taylor', 'email': 'olivia@example.com', 'balance': 3500.0},
    {'name': 'William Thomas', 'email': 'william@example.com', 'balance': 4500.0},
    {'name': 'Sophia Brown', 'email': 'sophia@example.com', 'balance': 2500.0},
  ];

  for (final user in users) {
    final id = await database.insert('users', user);
    print('Inserted user with id: $id');
  }

  // Close the database
  await database.close();
}
List<Map<String, dynamic>> dummyCustomers = [
  {'id': 1, 'name': 'John Doe', 'email': 'john@example.com', 'balance': 5000.0},
  // Add other customers here
];Future<Map<String, dynamic>?> getCustomerById(int id) async {
  final databasePath = await getDatabasesPath();
  final database = await openDatabase(join(databasePath, 'bank.db'));

  final results = await database.query('users', where: 'id = ?', whereArgs: [id]);

  await database.close();

  if (results.isNotEmpty) {
    return results.first;
  } else {
    return null;
  }
}