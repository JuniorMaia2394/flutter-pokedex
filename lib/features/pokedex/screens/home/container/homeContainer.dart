import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/errors/failure.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemonRepository.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/detailContainer.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/homeError.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/homeLoading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/homePage.dart';

class HomeContainer extends StatelessWidget {
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  const HomeContainer({
    required this.repository,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(
              list: snapshot.data!,
              onItemTap: onItemTap,
            );
          }

          if (snapshot.hasError) {
            return HomeError(
              error: (snapshot.error as Failure).message!,
            );
          }

          return Container();
        });
  }
}
