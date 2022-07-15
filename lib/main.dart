import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/details_page.dart';
import 'pages/home_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //await DBService.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //final box = Hive.box(DBService.dbName);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        DetailsPage.id: (context) => const DetailsPage(),

      },
    );
  }
}
