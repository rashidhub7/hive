import 'package:flutter/material.dart';
import 'package:untitled/functions.dart';
import 'package:untitled/model.dart';

class StudentWidget extends StatelessWidget {
  StudentWidget({Key? key}) : super(key: key);

  final _stdname = TextEditingController();
  final _age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _stdname,
          decoration: InputDecoration(
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _age,
          decoration: InputDecoration(
              hintText: "Age",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        ElevatedButton(
            onPressed: () {
              studentDetails();
              print("clcilking");
            },
            child: Text("Add Data")),
      ],
    );
  }

  Future<void> studentDetails() async {
    final _name = _stdname.text;
    final _stdage = _age.text;

    if (_name.isEmpty || _stdage.isEmpty) {
      return;
    } else {
      final _student = StudentModel(name: _name, age: _stdage);
      studentAdd(_student);


    }
  }
}
