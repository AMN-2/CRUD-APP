// ignore_for_file: unused_field, unnecessary_null_comparison, unused_element, body_might_complete_normally_nullable, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:crud/model/person.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class UpdatePersonForm extends StatefulWidget {
  const UpdatePersonForm(
      {super.key, required this.index, required this.person});
  final int index;
  final Person person;

  @override
  State<UpdatePersonForm> createState() => UpdatePersonFormState();
}

class UpdatePersonFormState extends State<UpdatePersonForm> {
  late final _namecontroller;
  late final _contrycontroller;
  ///////////////////////////////////////////////////////////////////////////////
  final _personFromKey =
      GlobalKey<FormState>(); // حتى اكدر احول الفورم بصورة مباشرة
  ///////////////////////////////////////////////////////////////////////////////

  late Box box;

  String? _fieldvalidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field is required ";
    }

    return null;
  }

  _UpdateInfo() async {
    Person newPerson = Person(
      name: _namecontroller.text,
      contry: _contrycontroller.text,
    );
    box.putAt(widget.index, newPerson);
    print("Updated Sucsessfly ");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box("peopleBox");
    _namecontroller = TextEditingController(text: widget.person.name);
    _contrycontroller = TextEditingController(text: widget.person.contry);
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name"),
          TextFormField(
            controller: _namecontroller,
            validator: _fieldvalidator,
          ),
          SizedBox(
            height: 24,
          ),
          Text("Contry"),
          TextFormField(
            controller: _contrycontroller,
            validator: _fieldvalidator,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 24),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_personFromKey.currentState!.validate()) {
                    _UpdateInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: Text("Save"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
