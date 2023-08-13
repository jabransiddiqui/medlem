import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 76, 87, 175).withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          width: 48,
          height: 48,
          child: const Center(
            child: Icon(
              Icons.local_grocery_store,
              size: 18,
              color: Color.fromARGB(255, 76, 87, 175),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          width: 48,
          height: 48,
          child: const Center(
            child: Icon(
              Icons.coffee,
              size: 18,
              color: Colors.green,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.orange.withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          width: 48,
          height: 48,
          child: const Center(
            child: Icon(
              Icons.cake,
              size: 18,
              color: Colors.orange,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          width: 48,
          height: 48,
          child: Center(
            child: Icon(
              Icons.local_pizza,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          width: 48,
          height: 48,
          child: const Center(
            child: Icon(
              Icons.local_parking_rounded,
              size: 18,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
