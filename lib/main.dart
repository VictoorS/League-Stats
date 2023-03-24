import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'profil.dart';
import 'info.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  sleep(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'VS.GG', home: MainPage(), debugShowCheckedModeBanner: false);
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('profil LoL'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: OpenInputUsername, icon: const Icon(Icons.info))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: OpenInputUsername, child: const Icon(Icons.add)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  'Cherche ton profil !',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.1,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  '1. Cliquez sur le bouton pour trouver votre profil',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.040,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.1,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  ' ',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.040,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Expanded(child: Image.asset('assets/images/b.png')),
              Expanded(child: Image.asset('assets/images/b.png')),
              Expanded(child: Image.asset('assets/images/b.png')),
              Expanded(child: Image.asset('assets/images/b.png')),
              SizedBox(
                height: width * 0.1,
              ),
              FittedBox(
                fit: BoxFit.cover,
              ),
              Expanded(child: Image.asset('assets/images/b.png')),
            ],
          ),
        ));
  }

  void OpenInputUsername() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InputUsername()));
  }

  void OpenAppInfo() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AppInfo()));
  }
}
