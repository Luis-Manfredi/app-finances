import 'package:app_finances/components/menu_button.dart';
import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';

class MenuOption {
  final String text;
  final IconData icon;

  const MenuOption({required this.text, required this.icon});
}

class MenuOptions {
  static const home = MenuOption(text: 'Home', icon: Icons.home_rounded);
  static const services = MenuOption(text: 'Services', icon: Icons.add_card);
  static const analytics = MenuOption(text: 'Analytics', icon: Icons.analytics_outlined);
  static const settings = MenuOption(text: 'Settings', icon: Icons.settings_applications);
  static const exit = MenuOption(text: 'Exit', icon: Icons.exit_to_app_rounded);

  static final List<MenuOption> all = [
    home,
    services,
    analytics,
    settings,
    exit
  ];
}

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.onButtonTapped}) : super(key: key);

  final ValueChanged<MenuOption> onButtonTapped;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget buildOptions(BuildContext context) => Container(
      height: size.height,
      padding: const EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: MenuOptions.all.map((item) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
            
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.text, style: TextStyle(color: white, fontSize: 18)),
                const SizedBox(width: 20),
                Icon(item.icon, color: white),
              ],
            ),
            onPressed: () => onButtonTapped(item),
          ),
        )).toList()
      ),
    );

    return Container(
      height: size.height,
      width: size.width,
      color: blue,

      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            buildOptions(context)
          ],
        ),
      )
    );
  }
}