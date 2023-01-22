import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_delivery/main.dart';
import 'package:project_delivery/pages/profile_page/edit_profile_form_page.dart';
import 'package:project_delivery/pages/profile_page/favorites_page.dart';
import 'package:project_delivery/pages/profile_page/languages_page.dart';
import 'package:project_delivery/pages/profile_page/orders_history_page.dart';

import '../../generated/locale_keys.g.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 120,
          padding: const EdgeInsets.all(10),
          color: const Color.fromRGBO(29, 29, 29, 1),
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
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfileFormPage(),
            ),
          ),
          child: _tileBuilder(
            Icon(Icons.edit_outlined),
            LocaleKeys.editProfile.tr(),
            Icon(Icons.chevron_right_outlined),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FavoritesPage(),
            ),
          ),
          child: _tileBuilder(
            Icon(Icons.favorite_border),
            LocaleKeys.favorite.tr(),
            Icon(Icons.chevron_right_outlined),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => BottomTabs(1),
            ),
          ),
          child: _tileBuilder(
            Icon(Icons.newspaper),
            LocaleKeys.news.tr(),
            Icon(Icons.chevron_right_outlined),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrdersHistoryPage(),
            ),
          ),
          child: _tileBuilder(
            Icon(Icons.receipt_long),
            LocaleKeys.historyOrders.tr(),
            Icon(Icons.chevron_right_outlined),
          ),
        ),
        _tileBuilder(
          Icon(Icons.thumb_up_outlined),
          LocaleKeys.commentUs.tr(),
          Icon(Icons.chevron_right_outlined),
        ),
        ListTile(
          textColor: Colors.white,
          iconColor: Colors.grey,
          leading: const Icon(Icons.notifications_outlined),
          title: Text(LocaleKeys.pushNot.tr()),
          trailing: Switch(onChanged: (bool value) {}, value: true),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: Color.fromRGBO(75, 75, 75, 1),
            height: 5,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LanguagesPage(),
              ),
            ).then((value) => setState(() {}));
          },
          child: ListTile(
            textColor: Colors.white,
            iconColor: Colors.grey,
            leading: const Icon(Icons.language),
            title: Text(LocaleKeys.languages.tr()),
            trailing: Text(
              LocaleKeys.language.tr(),
              style: const TextStyle(color: Colors.grey),
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
          leading: const Icon(Icons.logout),
          title: Text(LocaleKeys.logOut.tr()),
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
          leading: const Icon(Icons.delete_outline),
          title: Text(LocaleKeys.deleteAcc.tr()),
        ),
      ],
    );
  }
}
