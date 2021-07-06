import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:healthy_food/Screens/Home_screen.dart';

class my_drawer extends StatelessWidget {
  String text = 'Healthy Food ';
  String subject = 'follow me';

  my_drawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => home_screen()));
            },
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
              onTap: () async {
                await Share.share(text, subject: subject);
              },
              leading: Icon(
                Icons.share,
                color: Colors.blue,
              ),
              title: Text(
                'Share',
                style: TextStyle(fontSize: 25),
              )),
          ListTile(
              onTap: () {
                exit(0);
              },
              leading: Icon(
                Icons.login_outlined,
                color: Colors.blue,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 25),
              )),
        ],
      ),
    );
  }
}
