import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;

  CustomButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(name),
    );
  }
}
