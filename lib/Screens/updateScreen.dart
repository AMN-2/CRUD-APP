// ignore_for_file: prefer_const_constructors

import 'package:crud/model/person.dart';
import 'package:crud/utils/update_person_form.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.index, required this.person});

  final int index;
  final Person person;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("CRUD UPDATE "),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: UpdatePersonForm(index: widget.index, person: widget.person),
      ),
    );
  }
}
