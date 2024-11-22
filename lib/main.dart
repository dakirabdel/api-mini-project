import 'package:flutter/material.dart';
import 'package:projectect1/providers/ProductProvider.dart';
import 'package:projectect1/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'Model/models/user_model.dart';

import 'View/screens/auth/sign_in_screen.dart';
import 'View/screens/auth/sign_up_screen.dart';
import 'View/screens/home/profile_screen.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider(), // Add ProductProvider here
          ),
        ],
        child: MyApp(),
      ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return Consumer<AuthProvider>(builder: (context,authProvider,child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: authProvider.isAuthenticated ? ProfileScreen(): SignInScreen(),
      );
    });



  }
}
