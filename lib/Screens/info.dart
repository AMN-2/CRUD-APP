// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:crud/Screens/add_screen.dart';
import 'package:crud/Screens/updateScreen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

////////////////////////////////////////////////////////
class _InfoScreenState extends State<InfoScreen> {
  late final Box contactbox;

  _deleteInfo(int index) {
    contactbox.deleteAt(index);
    print("item is removed ");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactbox = Hive.box("peopleBox");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("CRUD MAIN "),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: contactbox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text("No Data Here "),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              ///////////////////////////////////////
              itemBuilder: (context, index) {
                var currentbox = box;
                var person_data = currentbox.getAt(index)!;
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => UpdateScreen(
                        index: index,
                        person: person_data,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(person_data.name),
                    subtitle: Text(person_data.contry),
                    // leading: Text("age = ${person_data.age}"),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => _deleteInfo(index),
                      color: Colors.redAccent,
                    ),
                  ),
                );
              },
              /////////////////////////////////////////////
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Add_Screen();
            },
          ),
        ),
      ),
    );
  }
}
