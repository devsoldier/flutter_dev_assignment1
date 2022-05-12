import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/model.dart';
import 'package:flutter_dev_assignment/provider/provider.dart';
import 'package:provider/provider.dart';

import '../screen/resource_detail.dart';

class ResourceWidget extends StatefulWidget {
  ResourceWidget({Key? key}) : super(key: key);

  @override
  State<ResourceWidget> createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  void retrieveresource() {
    Provider.of<UserProvider>(context, listen: false).getresource();
  }

  @override
  void initState() {
    retrieveresource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* Page Content */
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: MediaQuery.of(context).size.height * 0.7,
                    color: Colors.blue,
                    child: (data.resourcedetails.isEmpty)
                        ? CircularProgressIndicator(color: Colors.white)
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.bookdetails[0].per_page,
                            itemBuilder: (_, i) => Card(
                                child: Column(
                              children: [
                                Container(
                                    color: Colors.blue,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            ResourceDetailScreen.routeName,
                                            arguments: data.resourcedetails[i]);
                                      },
                                      child: ListTile(
                                        leading: Container(
                                            width: 50,
                                            height: 50,
                                            color: Color(int.parse(
                                                (data.resourcedetails[i].color)
                                                    .replaceAll('#', '0xff')
                                                    .toString()))),
                                        title: Text(
                                          '${data.resourcedetails[i].name}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        subtitle: Text(
                                          'year ${data.resourcedetails[i].year}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        trailing: Text(
                                          '${data.resourcedetails[i].pantone}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                          )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
