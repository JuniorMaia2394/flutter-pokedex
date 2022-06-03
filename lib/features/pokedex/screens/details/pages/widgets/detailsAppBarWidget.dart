import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';

class DetailsAppBarWidget extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;

  DetailsAppBarWidget({
    required this.pokemon,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.baseColor,
        leading: IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}