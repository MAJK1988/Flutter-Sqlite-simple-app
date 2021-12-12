import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'class/data_base.dart';
import 'class/user.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'user_database.db'),
    // When the database is first created, create a table to store users.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      /*final int id;
  final String name;
  final String email;
  final String adresse;
  final int age;
  final String phoneNumber; */
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, adresse TEXT, age INTEGER, phoneNumber TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts users into the database
  Future<void> insertDog(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }



  var fido = User(
    id: 0,
    name: 'Fido',
    adresse: 'Metz',
    email:'m.kaddour88',
    phoneNumber: '709587412',
    age: 35,
  );

  await insertUser(database,fido);

  // Now, use the method above to retrieve all the dogs.
  print(await users(database)); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sqlite tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Container() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



