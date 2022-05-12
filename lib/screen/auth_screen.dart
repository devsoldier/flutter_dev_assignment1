import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/widget/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(),
    );
  }
}
