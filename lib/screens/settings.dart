import 'package:app_finances/components/settings_options.dart';
import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key, required this.openFunction}) : super(key: key);

  final VoidCallback openFunction;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
  
        title: Text('Settings', style: TextStyle(color: blue, fontSize: 18, fontWeight: FontWeight.w400)),

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

        child: gridBuilder()
      ),

    );
  }

  Widget gridBuilder() {
    return GridView.builder(
      itemCount: settingsTiles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20
      ), 
      itemBuilder: (context, index) {
        var item = settingsTiles[index];

        return GestureDetector(
          onTap: () => print('It works!'),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: index == 1 || index == 2 ? yellow : blue,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(0, 2)
                )
              ]
            ),
            child: GridTile(
              header: Text(item.name, style: TextStyle(color: white, fontSize: 20)),
              footer: Text(
                item.footer, 
                style: TextStyle(fontSize: 11, color: white),
                maxLines: 2, 
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
              child: Center(
                child: Icon(item.icon, color: white, size: 30),
              )
            ),
          ),
        );
      }  
    );
  }
}