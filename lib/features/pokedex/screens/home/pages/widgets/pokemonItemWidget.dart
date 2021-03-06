import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/detailContainer.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/widgets/typeWidget.dart';

class PokemonItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final Function(String, DetailArguments) onItemTap;
  final int index;

  PokemonItemWidget({
    required this.pokemon,
    required this.onItemTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTap(
        '/details',
        DetailArguments(
          pokemon: pokemon,
          index: index,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemon.baseColor!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map(
                              (e) => TypeWidget(name: e),
                            )
                            .toList(),
                      ),
                      Flexible(
                        child: Container(
                          height: 130,
                          width: 150,
                        ),
                      ),
                      // Flexible(
                      //   child: Image.network(
                      //     pokemon.image,
                      //     height: 80,
                      //     width: 80,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            left: 60.0,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 130,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 5.0,
            child: Image.network(
              pokemon.image,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
