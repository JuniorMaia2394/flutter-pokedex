import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';

class DetailsItemListWidget extends StatelessWidget {
  final bool isDiff;
  final Pokemon pokemon;

  DetailsItemListWidget({
    required this.isDiff,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(60 / 360),
            child: Image.asset(
              'assets/images/pokeball.png',
              height: double.infinity,
              color: Colors.white.withOpacity(
                0.3,
              ),
            ),
          ),
        ),
        // Text(
        //   '#${pokemon.num}',
        //   style: TextStyle(
        //     fontSize: 150.0,
        //     color: Colors.black.withOpacity(0.3),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 25.0,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.network(
              pokemon.image,
              fit: BoxFit.contain,
              height: 180,
            ),
          ),
        ),
      ],
    );
  }
}
