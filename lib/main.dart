import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/screens/home/home_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmaClone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(elevation: 0),
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Builder(builder: (context) {
        return Builder(
          builder: (context) {
            return Provider.of<UserProvider>(context).user.token.isNotEmpty
                ? const HomeScreen()
                : const AuthScreen();
          },
        );
      }),
    );
  }
}
