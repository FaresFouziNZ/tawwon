import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/favorite_provider.dart';
import 'package:tawwon/screens/new_ui/on_boarding.dart';
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
      child: ChangeNotifierProvider(
        create: (_) => FavoriteProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const OnBoarding(),
            theme: ThemeData(
                primaryColor: const Color(0xFF213753),
                scaffoldBackgroundColor: const Color(0xFFF4F5F6),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: Colors.white, primary: const Color(0xFFFFFFFF)),
                fontFamily: 'ReadexPro')),
      ),
    );
  }
}
