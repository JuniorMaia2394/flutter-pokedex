import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detailsAppBarWidget.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detailsListWidget.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  DetailPage({
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailsAppBarWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailsListWidget(
            onChangePokemon: onChangePokemon,
            pokemon: pokemon,
            list: list,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
