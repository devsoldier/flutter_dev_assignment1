import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/screen/auth_screen.dart';
import 'package:flutter_dev_assignment/screen/resource_screen.dart';
import 'package:flutter_dev_assignment/screen/user_screen.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    Future<void> exit() async {
      await Provider.of<UserProvider>(context, listen: false).logout();
    }

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(UserScreen.routeName);
                  },
                  child: Text('User List'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ResourceScreen.routeName);
                  },
                  child: Text('Resource List'),
                ),
                ElevatedButton(
                  child: Text('logout'),
                  onPressed: () async {
                    await exit();
                    Navigator.of(context)
                        .pushReplacementNamed(AuthScreen.routeName);
                  },
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
