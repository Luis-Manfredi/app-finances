import 'package:app_finances/components/custom_button.dart';
import 'package:app_finances/constants/colors.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(20),
      height: size.height * 0.3,
      width: size.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1)
          )
        ]
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\$2737.94', style: TextStyle(color: blue, fontSize: 36)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Current balance', style: TextStyle(color: black)),
              Text('Bank of America', style: TextStyle(color: black))
            ],
          ),
          Divider(color: blue),
          SizedBox(
            width: size.width,
            child: TextButton(
              onPressed: (){}, 
              child: Text('Add another bank account', style: TextStyle(color: black))
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: 'Check income', 
                backgroundColor: blue, 
                textColor: white, 
                height: 40, 
                width: 130, 
                fontSize: 12, 
                onPressed: (){}
              ),
              CustomButton(
                text: 'Check outcome', 
                backgroundColor: yellow, 
                textColor: white, 
                height: 40, 
                width: 130, 
                fontSize: 12, 
                onPressed: (){}
              ),
            ],
          ),
        ],
      ),
    );
  }
}