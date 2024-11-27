import 'package:crudprovider/controller/providerController.dart';
import 'package:crudprovider/view/editpage/editpage.dart';
import 'package:crudprovider/view/homepage/addScreen/addStudents.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<simpleSaveItems>(context).getallDatas();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => Addstudents()));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<simpleSaveItems>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.storeAllDatas.length,
          itemBuilder: (context, index) {
            final valuesget = value.storeAllDatas[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Editpage(
                              name: valuesget.name,
                              age: valuesget.age,
                              index: index)));
                },
                child: Card(child: Text(valuesget.name.toString())));
          },
        ),
      ),
    );
  }
}
