import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';

class DetailsListWidget extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  DetailsListWidget({
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 81,
      left: 0,
      right: 0,
      height: 350,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30.0,
              ),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) => onChangePokemon(list[index]),
                  controller: controller,
                  children: list
                      .map(
                        (e) => Image.network(
                          'http://www.serebii.net/pokemongo/pokemon/006.png',
                          // 'e.image,'
                          fit: BoxFit.contain,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
