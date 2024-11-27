import 'package:crudprovider/controller/providerController.dart';
import 'package:crudprovider/model/studentModal/studentModals.dart';
import 'package:crudprovider/view/homepage/homapage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Editpage extends StatefulWidget {
  String? name;
  String? age;
  int index;
  Editpage({super.key, required this.name, required this.age,required this.index});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController forNameController = TextEditingController();
  TextEditingController forAgeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forNameController = TextEditingController(text: widget.name);
    forAgeController = TextEditingController(text: widget.age);
  }

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
                  editStudent(context);
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }

  Future editStudent(BuildContext context) async {
    final name = forNameController.text.trim();
    final age = forNameController.text.trim();
    final savedata = studentModal(name: name, age: age);
    Provider.of<simpleSaveItems>(context, listen: false)
        .editStudent(widget.index, savedata);
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomePage()));
  }
}
