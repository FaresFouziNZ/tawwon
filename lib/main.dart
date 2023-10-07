import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/screens/old_ui/welcome.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Auth().user,
      initialData: null,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const WelcomeView(),
          theme: ThemeData(
              primaryColor: const Color(0xFF213753),
              scaffoldBackgroundColor: const Color(0xFF213753),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white, primary: const Color(0xFF213753)),
              fontFamily: 'ReadexPro')),
    );
  }
}
