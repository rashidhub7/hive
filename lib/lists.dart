import 'package:flutter/material.dart';

import 'functions.dart';
import 'model.dart';

class ListWidegt extends StatelessWidget {
   ListWidegt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext context, List<StudentModel> studentList,
          Widget? child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = studentList[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: IconButton(
                  color: Colors.red,
                  onPressed: () {
                    if (data.id != null) {
                      deleteData(data.id!);
                    }else{
                      ("Data not Found");
                    }
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: studentList.length);
      },
    );
  }
}
