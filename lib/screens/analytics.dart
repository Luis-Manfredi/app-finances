import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key, required this.openFunction}) : super(key: key);

  final VoidCallback openFunction;

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: lightWhite,
  
      appBar: AppBar(
        elevation: 1,
        backgroundColor: white,
        leading: GestureDetector(
          onTap: widget.openFunction,
          child: Icon(Icons.menu, color: blue, size: 26)
        ),
  
        title: Text('Analytics', style: TextStyle(color: blue, fontSize: 18, fontWeight: FontWeight.w400)),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('User', style: TextStyle(color: blue, fontSize: 12)),
                      Text('Manage account', style: TextStyle(color: blue, fontSize: 10))
                    ],
                  ),

                  const SizedBox(width: 10),

                  CircleAvatar(
                    radius: 15,
                    backgroundColor: blue,
                    child: Icon(Icons.person, color: white),
                  )
                ],
              ),
          )
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(20),

        //TODO
      ),

    );
  }
}