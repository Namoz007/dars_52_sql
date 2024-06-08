import 'package:flutter/material.dart';
import 'package:working/services/local_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final localDaatabase = LocalDatabase();
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    final db = localDaatabase;
    addNote();
  }

  void addNote() async{
    setState(() {
      isLoading = true;
    });
    await localDaatabase.addNote('Ertaga mazza qilqib dars qilishh kerak emas!');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        centerTitle: true,
        leading: IconButton(onPressed: addNote, icon: Icon(Icons.add)),
      ),
      body: Column(
        children: [
          isLoading ? Center(child: CircularProgressIndicator()) : Center(child: Text("Notes"))
        ],
      ),
    );
  }
}
