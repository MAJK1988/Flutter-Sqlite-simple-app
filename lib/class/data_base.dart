// Define a function that inserts users into the database
  import 'package:sqflite/sqflite.dart';

import 'user.dart';

Future<void> insertUser(Future<Database> database, User user) async {
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


    // A method that retrieves all the users from the users table.
  Future<List<User>> users(Future<Database> database,) async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The users.
    final List<Map<String, dynamic>> maps = await db.query('users');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return User(
        email: maps[i]['email'],
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        adresse: maps[i]['adresse'],
        phoneNumber: maps[i]['phoneNumber'],
      );
    });
  }

  Future<void> updateUser(Future<Database> database,User user) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'users',
      user.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(Future<Database> database,int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }