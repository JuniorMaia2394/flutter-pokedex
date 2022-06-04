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
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 200,
        ),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
          curve: Curves.easeIn,
          duration: const Duration(
            milliseconds: 200,
          ),
          tween: Tween<double>(
            end: isDiff ? 100 : 300,
            begin: isDiff ? 300 : 100,
          ),
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Image.network(
                pokemon.image,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
                fit: BoxFit.contain,
                width: value,
              ),
            );
          },
        ),
      ),
    );
  }
}
