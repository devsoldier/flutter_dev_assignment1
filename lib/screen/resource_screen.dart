import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/widget/resource_widget.dart';

class ResourceScreen extends StatelessWidget {
  const ResourceScreen({Key? key}) : super(key: key);
  static const routeName = '/resourcescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter dev assignment'),
      ),
      body: ResourceWidget(),
    );
  }
}
