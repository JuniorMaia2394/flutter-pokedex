import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';

class DetailsAppBarWidget extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  DetailsAppBarWidget({
    required this.pokemon,
    required this.onBack,
    required this.isOnTop,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
      centerTitle: false,
      title: isOnTop
          ? Container()
          : Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }
}
