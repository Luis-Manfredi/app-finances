import 'package:app_finances/components/services_class.dart';
import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Services extends StatefulWidget {
  const Services({Key? key, required this.openFunction}) : super(key: key);

  final VoidCallback openFunction;

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  late List<Service> servicesList;
  String query = '';

  @override
  void initState() {
    super.initState();

    servicesList = services;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightWhite,
  
      appBar: AppBar(
        elevation: 1,
        backgroundColor: white,
        leading: GestureDetector(
          onTap: widget.openFunction,
          child: Icon(Icons.menu, color: blue, size: 26)
        ),
  
        title: Text('Services', style: TextStyle(color: blue, fontSize: 18, fontWeight: FontWeight.w400)),

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
            buildSearchbar(),

            const SizedBox(height: 20),
        
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var service = servicesList[index];
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
                itemCount: servicesList.length
              ),
            )
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: (){},
            backgroundColor: blue,
            child: Icon(Icons.add, color: white),
          ),
        ),
      ),
    );
  }

  void searchService(String query) {
    final servicesList = services.where((service) {
      final lowerName = service.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return lowerName.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.servicesList = servicesList;
    });
  }

  Widget buildSearchbar() => Searchbar(
    onChanged: searchService,
  );
}

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<String> onChanged;

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.1),
            spreadRadius: 2, 
            blurRadius: 2,
            offset: const Offset(0, 1)
          )
        ]
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search service',
          hintStyle: const TextStyle(color: Colors.black45),
          icon: Icon(Icons.search_rounded, color: blue,)
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}