import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assessment/app/bottom_nav_bar.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      PopScope(
        canPop: false,
        onPopInvoked: (bool didPop){
    },
    child:const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assessment',
      home: NavigationWidget(),

    ) );
  }
}
