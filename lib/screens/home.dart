import 'package:app_finances/components/custom_button.dart';
import 'package:app_finances/components/services_class.dart';
import 'package:app_finances/components/status_card.dart';
import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.openFunction}) : super(key: key);

  final VoidCallback openFunction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightWhite,
  
      appBar: AppBar(
        elevation: 1,
        backgroundColor: white,
        leading: GestureDetector(
          onTap: openFunction,
          child: Icon(Icons.menu, color: blue, size: 26)
        ),
  
        title: Text('Home', style: TextStyle(color: blue, fontSize: 18, fontWeight: FontWeight.w400)),

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
        child: Column(
          children: [
            StatusCard(size: size),
            
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Recent Transactions', style: TextStyle(color: blue, fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            
            Expanded(
              child: listBuilder()
            )
          ],
        ),
      ),
    );
  }

  Widget listBuilder() {  
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var service = services[index];
    
        return ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              service.icon,
            ],
          ),
          title: Text(service.name, overflow: TextOverflow.fade, maxLines: 1,),
          subtitle: Text(service.type),
          trailing: Text('\$${service.cost}'),
          tileColor: white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
        ); 
      },
      separatorBuilder: (context, index) => const SizedBox(height: 15), 
      itemCount: services.getRange(0, 4).toList().length
    );
  }
}