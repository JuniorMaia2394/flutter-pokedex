import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/common/repositories/pokemonRepository.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_flutter/features/route.dart';

void main() async {
  runApp(
    GetMaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(dio: Dio()),
      ),

      // HomeContainer(
      //   repository: PokemonRepository(dio: Dio()),
      // ),
    ),
  );
}
