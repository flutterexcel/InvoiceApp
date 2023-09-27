import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';

class AdditionalDetailsPage extends StatefulWidget {
  const AdditionalDetailsPage({super.key});

  @override
  State<AdditionalDetailsPage> createState() => _AdditionalDetailsPageState();
}

class _AdditionalDetailsPageState extends State<AdditionalDetailsPage> {
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Additional details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              padding: EdgeInsets.only(left: 5, top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                child: Center(
                    child: Row(
                  children: [
                    customText(text: 'Notes', textColor: Colors.grey.shade400),
                  ],
                )),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                          text: 'Save as default', textColor: Colors.black),
                      Switch(
                          // thumb color (round icon)
                          activeColor: Colors.amber,
                          activeTrackColor: Colors.cyan,
                          inactiveThumbColor: Colors.blueGrey.shade600,
                          inactiveTrackColor: Colors.grey.shade400,
                          splashRadius: 50.0,
                          value: switched,
                          // changes the state of the switch
                          onChanged: (value) {
                            // themeProvider.toggleTheme();
                            switched = !switched;
                            setState(() {});
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
