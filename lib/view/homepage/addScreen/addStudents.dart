import 'package:crudprovider/controller/providerController.dart';
import 'package:crudprovider/model/studentModal/studentModals.dart';
import 'package:crudprovider/view/homepage/homapage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addstudents extends StatelessWidget {
  Addstudents({super.key});

  TextEditingController forNameController = TextEditingController();
  TextEditingController forAgeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: forNameController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: forAgeController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  addTheStudent(context);
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }

  Future addTheStudent(BuildContext context) async {
    final name = forNameController.text.trim();
    final age = forNameController.text.trim();
    final savedata = studentModal(name: name, age: age);
    Provider.of<simpleSaveItems>(context, listen: false)
        .addStudentDetails(savedata);
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomePage()));
  }
}
