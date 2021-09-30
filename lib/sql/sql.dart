import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DbName {
  static const String user_table = "user_table";
}

class Sqllite {
  final String sql_createTable =
      'CREATE TABLE user_table (id INTEGER PRIMARY KEY, username TEXT,pwd Text)';
  String dbPath = "";
  // 创建数据库
  Future<String> initDeleteDb(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    if (await Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print("create sql error, error -> $e");
      }
    }
    return path;
  }

  Future create(String dbName) async {
    final String path = await this.initDeleteDb(dbName);
    print("dbpath is : $path");
    this.dbPath = path;
    Database _db = await openDatabase(this.dbPath);
    /** 执行创建sql表 */
    await _db.execute(this.sql_createTable);
    await _db.close();
    print("sql create success 🚀");
  }

  Future add(String username, String pwd) async {
    Database db = await openDatabase(this.dbPath);
    String sql =
        "INSERT INTO user_table(username,pwd) VALUES('$username','$pwd')";
    await db.transaction((txn) async {
      int id = await txn.rawInsert(sql);
    });

    await db.close();

    print("username: $username password: $pwd insert success!");
  }

  Future delete(String id) async {
    Database db = await openDatabase(this.dbPath);
    String sql = "DELETE FROM user_table WHERE id = ?";
    int count = await db.rawDelete(sql, [id]);
    await db.close();
    if (count == 1) {
      print("delete success! 🚀");
    } else {
      print("delete fail! ⚠️");
    }
  }

  Future update({@required String? pwd, @required String? id}) async {
    Database db = await openDatabase(this.dbPath);
    String sql = "UPDATE user_table SET pwd = ? WHERE id = ?";
    int count = await db.rawUpdate(sql, [pwd, id]);
    await db.close();
    if (count == 1) {
      print("update success! 🚀");
    } else {
      print("update error! ⚠️");
    }
  }

  Future<List<Map<String, dynamic>>> query() async {
    final db = await openDatabase(this.dbPath);
    final String sqlQuery = "SELECT * FROM user_table";
    List<Map<String, dynamic>> list = await db.rawQuery(sqlQuery);
    await db.close();
    return list;
  }

  Future<int> queryNum([String path = DbName.user_table]) async {
    Database db = await openDatabase(path);
    final String sqlQuery = "SELECT * FROM ${DbName.user_table}";
    int? _num = Sqflite.firstIntValue(await db.query(sqlQuery));
    await db.close();
    return _num ?? 0;
  }
}

final Sqllite sql = Sqllite();
