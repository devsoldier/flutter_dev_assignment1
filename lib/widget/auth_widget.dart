import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/provider.dart';
import 'package:flutter_dev_assignment/screen/home.dart';
import 'package:flutter_dev_assignment/screen/user_detail.dart';
import 'package:provider/provider.dart';
import '../screen/user_screen.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final GlobalKey<FormState> authkey = GlobalKey();
  final obscuretext = true;
  Map<String, String> registerdata = {
    "email": "",
    "password": "",
  };

  Future<void> submitsignup() async {
    if (!authkey.currentState!.validate()) {
      return;
    }
    authkey.currentState!.save();
    await Provider.of<UserProvider>(context, listen: false)
        .register(registerdata["email"]!, registerdata["password"]!);
  }

  Future<void> submitlogin() async {
    if (!authkey.currentState!.validate()) {
      return;
    }
    authkey.currentState!.save();
    await Provider.of<UserProvider>(context, listen: false)
        .register(registerdata["email"]!, registerdata["password"]!);
  }

  void showerrordialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
          title: Text(
            'error occured',
          ),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: Text('close'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: authkey,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined, color: Colors.blue),
                        SizedBox(width: 15),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'invalid email!';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              registerdata["email"] = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(Icons.security_rounded, color: Colors.blue),
                        SizedBox(width: 15),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            obscureText: obscuretext,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 5) {
                                return 'password is too short!';
                              }
                            },
                            onSaved: (value) {
                              registerdata["password"] = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: submitsignup,
                    child: Text('Signup'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      await submitlogin();
                      (data.isAuthenticated == true)
                          ? Navigator.of(context)
                              .pushReplacementNamed(HomePage.routeName)
                          : showerrordialog('not authenticated');
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
