import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_delivery/pages/profile_page/languages_pages.dart';

import '../../generated/locale_keys.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  Column _tileBuilder(Icon lead, String text, Icon trail) {
    return Column(
      children: [
        ListTile(
          iconColor: Colors.grey,
          textColor: Colors.white,
          leading: lead,
          title: Text(text),
          trailing: trail,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: Color.fromRGBO(75, 75, 75, 1),
            height: 5,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 120,
          padding: EdgeInsets.all(10),
          color: Color.fromRGBO(29, 29, 29, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'number',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '0 points',
                    style: TextStyle(fontSize: 20, color: Colors.orange),
                  ),
                ],
              ),
              FlutterLogo(
                size: 100,
              ),
            ],
          ),
        ),
        _tileBuilder(
          Icon(Icons.edit_outlined),
          'qqq',
          Icon(Icons.chevron_right_outlined),
        ),
        _tileBuilder(
          Icon(Icons.favorite_border),
          'qqq',
          Icon(Icons.chevron_right_outlined),
        ),
        _tileBuilder(
          Icon(Icons.newspaper),
          'qqq',
          Icon(Icons.chevron_right_outlined),
        ),
        _tileBuilder(
          Icon(Icons.receipt_long),
          'qqq',
          Icon(Icons.chevron_right_outlined),
        ),
        _tileBuilder(
          Icon(Icons.thumb_up_outlined),
          'qqq',
          Icon(Icons.chevron_right_outlined),
        ),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.grey,
          leading: Icon(Icons.notifications_outlined),
          title: Text('qqq'),
          trailing: Switch(onChanged: (bool value) {}, value: true),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: Color.fromRGBO(75, 75, 75, 1),
            height: 5,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LanguagesPages(),
              ),
            );
          },
          child: ListTile(
            textColor: Colors.white,
            iconColor: Colors.grey,
            leading: Icon(Icons.language),
            title: Text('qqq'),
            trailing: Text(
              'English',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: Color.fromRGBO(75, 75, 75, 1),
            height: 5,
          ),
        ),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.grey,
          leading: Icon(Icons.logout),
          title: Text('qqq'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: Color.fromRGBO(75, 75, 75, 1),
            height: 5,
          ),
        ),
        ListTile(
          textColor: Colors.red,
          iconColor: Colors.red,
          leading: Icon(Icons.delete_outline),
          title: Text('qqq'),
        ),
      ],
    );
  }
}
