import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';

class EditProfileFormPage extends StatefulWidget {
  const EditProfileFormPage({super.key});

  @override
  State<EditProfileFormPage> createState() => _EditProfileFormPageState();
}

class _EditProfileFormPageState extends State<EditProfileFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.editProfile.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 136,
                      left: 258,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 203, 203, 203),
                        radius: 12,
                        child: Icon(
                          Icons.edit,
                          color: Color(0xFF656262),
                          size: 17,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  child: const Text(
                    '+380 11 111 11 11',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 43, 43, 43)),
          margin: EdgeInsets.all(20),
          child: Text(
            'Save',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
