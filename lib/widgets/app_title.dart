import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  AppTitle({super.key});

  String pokeballImageUrl = "assets/images/pokeball.png";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: const Text("Pokedex"),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              pokeballImageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
