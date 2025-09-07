import 'package:flutter/material.dart';
import 'package:newproject/screens/inicio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}
