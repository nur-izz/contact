import 'package:contact/peopleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';


class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();

}

class _ViewPageState extends State<ViewPage> {
  bool isDescending = false;


  List<ListPeople> people = [
    ListPeople(
      user:'Chan Saw Lin',
      phone: '0152131113',
      clock: '2020-06-30 16:10:05'),
    ListPeople(
        user:'Lee Saw Loy',
        phone: '0161231346',
        clock: '2020-07-11 15:39:59'),
    ListPeople(
        user: 'Khaw Tong Lin',
        phone: '0158398109',
        clock: '2020-08-19 11:10:18'),
    ListPeople(
        user: 'Lim Kok Lin',
        phone: '0168279101',
        clock: '2020-08-19 11:11:35'),
    ListPeople(
        user: 'Low Jun Wei',
        phone: '0112731912',
        clock: '2020-08-15 13:00:05'),
    ListPeople(
        user: 'Yong Weng Kai',
        phone: '0172332743',
        clock: '2020-07-31 18:10:11'),
    ListPeople(
        user: 'Jayden Lee',
        phone: '0191236439',
        clock: '2020-08-22 08:10:38'),
    ListPeople(
        user: 'Kong Kah Yan',
        phone: '0111931233',
        clock: '2020-07-11 12:00:00'),
    ListPeople(
        user: 'Jasmine Lau',
        phone: '0162879190',
        clock: '2020-08-01 12:10:05'),
    ListPeople(
        user: 'Chan Saw Lin',
        phone: '016783239',
        clock: '2020-08-23 11:59:05')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: Color(0xFFf7be7c),
        centerTitle: true,
      ),
      body:
      Column(
        children: [
          TextButton.icon(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.compare_arrows, size: 28),
            ),
            label: Text(
              isDescending ? 'unsort':'Sort', style: TextStyle(fontSize: 16),
            ),
            onPressed: () => setState(() => isDescending = !isDescending),
          ),
      Expanded(child: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Text(people[index].user),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(people[index].phone),
                    Text(people[index].clock)
                  ],
                ),
                onTap: (){
                  final String text = "Name: ${people[index].user}, \n Phone num: ${people[index].phone}, \n Date/Time: ${people[index].clock}";
                  Share.share(text);
                },
              ),
            );
          }),
      ),
        ])
    );
  }
  void share(BuildContext context, ListPeople listpeople) {
    final String text = "${listpeople.user} - ${listpeople.phone} - ${listpeople.clock}";
    RenderBox? box = context.findRenderObject() as RenderBox;
    Share.share(text, subject: listpeople.user , sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

}
