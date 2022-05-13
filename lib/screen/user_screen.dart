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
                      child: (data.bookdetails.isEmpty)
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
                                              UserDetailScreen.routeName,
                                              arguments: data.userdetails[i]);
                                        },
                                        child: ListTile(
                                          leading: Image.network(
                                              '${data.userdetails[i].avatar}'),
                                          title: Text(
                                            '${data.userdetails[i].fname}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            '${data.userdetails[i].lname}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          trailing: Text(
                                            '${data.userdetails[i].email}',
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
              (data.bookdetails.isEmpty)
                  ? CircularProgressIndicator()
                  : Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.bookdetails[0].total_pages,
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
