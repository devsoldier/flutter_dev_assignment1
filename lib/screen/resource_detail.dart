import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/model.dart';

class ResourceDetailScreen extends StatelessWidget {
  const ResourceDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/resourcedetailscreen';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as ResourceDetails;
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
                        leading: Container(
                            width: 50,
                            height: 50,
                            color: Color(int.parse((data.color)
                                .replaceAll('#', '0xff')
                                .toString()))),
                        title: Text(
                          data.name,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle: Text(
                          'year ${data.year}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        trailing: Text(
                          data.pantone,
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
