import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/detailContainer.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/widgets/pokemonItemWidget.dart';

class HomePage extends StatelessWidget {
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  const HomePage({
    required this.list,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Pokedex',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
          ),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: list
                  .map((e) => PokemonItemWidget(
                        pokemon: e,
                        onItemTap: onItemTap,
                      ))
                  .toList()),
        ));
  }
}
