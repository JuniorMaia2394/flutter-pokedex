import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/errors/failure.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemonRepository.dart';
import 'package:pokedex_flutter/common/widgets/poError.dart';
import 'package:pokedex_flutter/common/widgets/poLoading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/detailsPage.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/homeError.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/homeLoading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/homePage.dart';

class DetailArguments {
  final String name;

  DetailArguments({required this.name});
}

class DetailContainer extends StatelessWidget {
  final IPokemonRepository repository;
  final DetailArguments arguments;

  const DetailContainer({
    required this.repository,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(
              name: arguments.name,
              list: snapshot.data!,
            );
          }

          if (snapshot.hasError) {
            return PoError(
              error: (snapshot.error as Failure).message!,
            );
          }

          return Container();
        });
  }
}
