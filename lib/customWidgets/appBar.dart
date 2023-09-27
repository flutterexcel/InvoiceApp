// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/screens/settingPages/settingPage.dart';

class AppBarr extends StatefulWidget with PreferredSizeWidget {
  String centerTitle;
  AppBarr({this.centerTitle = ''});
  @override
  State<AppBarr> createState() => _AppBarrState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarrState extends State<AppBarr> {
  bool searchTapped = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: blueColor,
      leading: InkWell(
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, a, b) => const SettingPage()));
        },
      ),
      title: const Text(
        "Reports",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        searchTapped
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    color: Colors.white,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 8),
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                searchTapped = false;
                              });
                            },
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: blueColor,
                          fontFamily: "RobotoThin",
                        ),
                      ),
                    )),
              )
            : InkWell(
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    searchTapped = true;
                  });
                },
              ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
