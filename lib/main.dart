import 'package:crudprovider/controller/providerController.dart';
import 'package:crudprovider/model/studentModal/studentModals.dart';
import 'package:crudprovider/view/homepage/addScreen/addStudents.dart';
import 'package:crudprovider/view/homepage/homapage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(studentModalAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => simpleSaveItems(),
        )
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
