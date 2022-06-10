import 'package:app_finances/constants/colors.dart';
import 'package:app_finances/screens/analytics.dart';
import 'package:app_finances/screens/fake_page.dart';
import 'package:app_finances/screens/home.dart';
import 'package:app_finances/screens/menu.dart';
import 'package:app_finances/screens/services.dart';
import 'package:app_finances/screens/settings.dart';
import 'package:app_finances/screens/splash.dart';
import 'package:flutter/material.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool menuOpen = false;
  bool isRounded = false;
  bool isDragged = false;
  MenuOption item = MenuOptions.home;

  void openMenu() => setState(() {
    xOffset = 220;
    yOffset = 140;
    scaleFactor = 0.7;
    menuOpen = true;
    isRounded = true;
  });

  void closeMenu() => setState(() {
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    menuOpen = false;
    isRounded = false;
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          menu(),
          const Fake(),
          scalePage()
        ],
      ),
    );
  }

  Widget scalePage() {
    Size size = MediaQuery.of(context).size;
  
    return WillPopScope(
      onWillPop: () async {
        if (menuOpen) {
          closeMenu();

          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: menuOpen == true ? () => closeMenu() : null,
        onHorizontalDragStart: (details) => isDragged = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragged) return;
    
          const delta = 1;
          if (details.delta.dx > delta){
            openMenu();
          }
          else if (details.delta.dx < -delta){
            closeMenu();
          }
    
          isDragged = false;
        },
    
        child: AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
            duration: const Duration(milliseconds: 250),
            height: size.height,
            width: size.width,
    
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(isRounded ? 20 : 0)),
              child: getMenuPage(),
            ),
        ),
      ),
    );
  }

  Widget menu() => SafeArea(
    child: Menu(onButtonTapped: (item) {
      setState(() => this.item = item);
      closeMenu();
    }),
  );

  Widget getMenuPage(){
    switch (item) {
      case MenuOptions.exit:
        return const Splash();
      case MenuOptions.services:
        return Services(openFunction: openMenu);
      case MenuOptions.analytics:
        return Analytics(openFunction: openMenu);
      case MenuOptions.settings:
        return Settings(openFunction: openMenu);
      case MenuOptions.home:
      default:
        return Home(openFunction: openMenu);
       
    }
  }
}