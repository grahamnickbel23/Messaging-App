import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final void Function()? onTap;
  final String heading;

  const MyButton(
    {
      super.key, 
    required this.heading,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 143, vertical: 25),
            child: Text(
              heading, 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color:Theme.of(context).colorScheme.tertiary
              )),
          ),
        ));
  }
}
