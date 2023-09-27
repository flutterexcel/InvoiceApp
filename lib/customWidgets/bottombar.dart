// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/screens/clients.dart';
import 'package:invoice_maker/screens/estimates.dart';
import 'package:invoice_maker/screens/invoices.dart';
import 'package:invoice_maker/screens/itemsPage.dart';
import 'package:invoice_maker/screens/reportsPage.dart';

class BottomBar extends StatefulWidget {
  int currentIndex;
  BottomBar({this.currentIndex = 0, super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      selectedItemColor: blueColor,
      onTap: (index) {
        setState(() {
          widget.currentIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(pageBuilder: (context, a, b) => InvoicePage()),
                (route) => false);
            break;
          case 1:
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, a, b) => EstimatesPage()),
                (route) => false);
            break;

          case 2:
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(pageBuilder: (context, a, b) => ClientsPage()),
                (route) => false);
            break;
          case 3:
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(pageBuilder: (context, a, b) => ItemsPage()),
                (route) => false);
            break;
          case 4:
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(pageBuilder: (context, a, b) => ReportsPage()),
                (route) => false);
            break;
          default:
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Invoices',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate_outlined),
          label: 'Estimates',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Clients',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_open),
          label: 'Items',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.signal_cellular_alt),
          label: 'Reports',
        ),
      ],
    );
  }
}
