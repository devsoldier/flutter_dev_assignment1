import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/provider.dart';
import 'package:flutter_dev_assignment/screen/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> authkey = GlobalKey();
  bool validate = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  final obscuretext = true;

  Future<void> submitsignup() async {
    // authkey.currentState!.save();
    await Provider.of<UserProvider>(context, listen: false)
        .register(email.text, password.text);
  }

  Future<void> submitlogin() async {
    // authkey.currentState!.save();
    await Provider.of<UserProvider>(context, listen: false)
        .register(email.text, password.text);
  }

  String? get errorEmailText {
    final emailtext = email.value.text;
    if (emailtext.isEmpty || !emailtext.contains('@')) {
      return 'invalid email';
    }
  }

  String? get errorPasswordText {
    final passwordtext = password.value.text;
    if (passwordtext.isEmpty || passwordtext.length < 5) {
      return 'cannot be too short or emty';
    }
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

  Future<void> checkAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool auth = prefs.getBool('isAuthenticated') ?? false;
    print('is authenticated? : $auth');
    if (auth == false) {
      print('not logged in');
    } else if (auth == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    checkAuth();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
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
                          Icon(Icons.account_circle_outlined,
                              color: Colors.blue),
                          SizedBox(width: 15),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: email,
                              focusNode: emailfocus,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  errorText: (emailfocus.hasFocus)
                                      ? errorEmailText
                                      : null),
                              onChanged: (_) {
                                setState(() {});
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
                            child: TextField(
                              controller: password,
                              focusNode: passwordfocus,
                              obscureText: obscuretext,
                              decoration: InputDecoration(
                                  errorText: (passwordfocus.hasFocus)
                                      ? errorPasswordText
                                      : null),
                              onChanged: (_) {
                                setState(() {});
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
      ),
    );
  }
}
