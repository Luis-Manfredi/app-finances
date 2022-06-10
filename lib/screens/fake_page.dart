import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';

class Fake extends StatelessWidget {
  const Fake({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(210, 150, 0)..scale(0.7),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Scaffold(
          backgroundColor: lightWhite.withOpacity(0.8),
        
          appBar: AppBar(
            elevation: 1,
            backgroundColor: white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}