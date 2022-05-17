import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/provider/provider.dart';
import 'package:provider/provider.dart';

import 'user_detail.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  static const routeName = '/userscreen';

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final int page = 1;
  final bool activepage = true;
  int? selectedpage = 0;

  void getusers(int pagenumber) {
    Provider.of<UserProvider>(context, listen: false).getusers(pagenumber);
  }

  @override
  void initState() {
    getusers(page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter dev assignment'),
      ),
      body: Column(
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
                      child: (data.userdetails != null)
                          ? CircularProgressIndicator(color: Colors.white)
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.userdetails?.per_page ?? 0,
                              itemBuilder: (_, i) => Card(
                                  child: Column(
                                children: [
                                  Container(
                                      color: Colors.blue,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              UserDetailScreen.routeName,
                                              arguments:
                                                  data.userdetails?.data[i]);
                                        },
                                        child: ListTile(
                                          leading: Image.network(
                                              '${data.userdetails?.data[i].avatar}'),
                                          title: Text(
                                            '${data.userdetails?.data[i].fname}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            '${data.userdetails?.data[i].lname}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          trailing: Text(
                                            '${data.userdetails?.data[i].email}',
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
          SizedBox(
            height: 15,
          ),
          /* Page numbering */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (data.userdetails != null)
                  ? CircularProgressIndicator()
                  : Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.userdetails?.total_pages ?? 0,
                          itemBuilder: (_, i) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedpage = i;
                                  });
                                  getusers(i + 1);
                                },
                                child: Card(
                                    child: Container(
                                        color: selectedpage == i
                                            ? Colors.blue
                                            : Colors.white,
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 30,
                                        child: Text('${i + 1}'))),
                              )),
                    )
            ],
          )
        ],
      ),
    );
  }
}
