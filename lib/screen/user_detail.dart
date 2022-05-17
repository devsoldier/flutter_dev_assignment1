import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/model.dart';

class UserDetailScreen extends StatelessWidget {
  static const routeName = '/userdetail';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as UserDetails;
    return Scaffold(
        appBar: AppBar(
          title: Text('User Details Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListTile(
                        leading: Image.network(data.avatar),
                        title: Text(
                          data.firstName,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle: Text(
                          data.lastName,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        trailing: Text(
                          data.email,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
