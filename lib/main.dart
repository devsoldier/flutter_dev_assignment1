import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/provider.dart';
import 'package:flutter_dev_assignment/screen/auth_screen.dart';
import 'package:flutter_dev_assignment/screen/home.dart';
import 'package:flutter_dev_assignment/screen/resource_detail.dart';
import 'package:flutter_dev_assignment/screen/resource_screen.dart';
import 'package:flutter_dev_assignment/screen/user_detail.dart';
import 'package:provider/provider.dart';
import 'screen/user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'flutter dev assignment',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthScreen(),
          routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            HomePage.routeName: (ctx) => HomePage(),
            UserScreen.routeName: (ctx) => UserScreen(),
            UserDetailScreen.routeName: (ctx) => UserDetailScreen(),
            ResourceScreen.routeName: (ctx) => ResourceScreen(),
            ResourceDetailScreen.routeName: (ctx) => ResourceDetailScreen(),
          }),
    );
  }
}
