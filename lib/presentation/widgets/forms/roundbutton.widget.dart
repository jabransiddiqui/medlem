import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget(
      {super.key, required this.onPressed, required this.iconName});
  final Function()? onPressed;
  final IconData iconName;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: 48,
        height: 48,
        child: Center(
          child: Icon(
            iconName,
            size: 18,
          ),
        ),
      ),
    );
  }
}
