import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/widget/user_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
  static const routeName = '/userscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter dev assignment'),
      ),
      body: UserWidget(),
    );
  }
}
