import 'package:app_finances/screens/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_finances/components/custom_button.dart';
import 'package:app_finances/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    String intro = 'Control your income and expenses smartly with our highly accessible tools. A solution for your finances.';

    return Scaffold(
      backgroundColor: blue,

      body: Stack(
        children: [

          // Circles SVG
          Positioned(
            top: -10,
            child: SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: ShaderMask(
                child: SvgPicture.asset('assets/svg/circle-scatter-haikei.svg'),
                shaderCallback: (bounds) => LinearGradient(
                  colors: [white, blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight 
                ).createShader(bounds)
              ),
            )
          ),


          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 50,
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Texts Container
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: size.height * 0.2,
                      width: size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('A better way to manage your finances', style: TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.bold)),

                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(intro, style: TextStyle(color: white)),
                          )
                        ],
                      ),
                    ),

                    // Get Started Button
                    CustomButton(
                      text: 'Get Started', 
                      fontSize: 18,
                      backgroundColor: yellow,
                      backgroundColorTwo: yellowTwo, 
                      isGradient: true,
                      textColor: blue, 
                      height: 60,
                      width: size.width,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeController())),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}