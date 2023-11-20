// ignore_for_file: unused_field, unnecessary_null_comparison, unused_element, body_might_complete_normally_nullable, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:crud/model/person.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({super.key});

  @override
  State<AddPersonForm> createState() => AddPersonFormState();
}

class AddPersonFormState extends State<AddPersonForm> {
  final _namecontroller = TextEditingController();
  final _contrycontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  ///////////////////////////////////////////////////////////////////////////////
  final _personFromKey =
      GlobalKey<FormState>(); // حتى اكدر احول الفورم بصورة مباشرة
  ///////////////////////////////////////////////////////////////////////////////

  late final Box box; // بس اعلان عن هذا

  String? _fieldvalidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field is required ";
    }

    return null;
  }

  _addInfo() async {
    Person newPerson = Person(
      name: _namecontroller.text,
      contry: _contrycontroller.text,
    );
    box.add(newPerson);
    print("the data is added sucessfuly ");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box("peopleBox");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFromKey,
      child: Column(
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
          SizedBox(
            height: 24,
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
                    _addInfo();
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
