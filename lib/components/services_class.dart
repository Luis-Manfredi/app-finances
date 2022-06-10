import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Service{
  String type, name;
  double cost;
  Icon icon;

  Service({required this.name, required this.type, required this.cost, required this.icon});
}

List<Service> services = [
  Service(name: 'Spotify', type: 'Music Streaming', cost: 5.99, icon: Icon(FontAwesomeIcons.spotify, color: yellow, size: 30)),
  Service(name: 'Netflix', type: 'TV Streaming', cost: 7.99, icon: Icon(Icons.tv, color: yellow, size: 30)),
  Service(name: 'Car Repair', type: 'Car Maintenance', cost: 200.50, icon: Icon(Icons.car_crash_rounded, color: yellow, size: 30)),
  Service(name: 'New Laptop', type: 'Asset', cost: 1299.99, icon: Icon(FontAwesomeIcons.laptop, color: yellow, size: 30)),
  Service(name: 'Bar Receipt', type: 'Food & Drinks', cost: 20.45, icon: Icon(FontAwesomeIcons.beerMugEmpty, color: yellow, size: 30)),
  Service(name: 'New Clothes', type: 'Shopping', cost: 45.39, icon: Icon(FontAwesomeIcons.shirt, color: yellow, size: 30)),
  Service(name: 'Groceries', type: 'Food & Drinks', cost: 150.67, icon: Icon(Icons.storefront_outlined, color: yellow, size: 30))
];