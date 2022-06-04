import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_flutter/common/consts/apiConsts.dart';
import 'package:pokedex_flutter/common/errors/failure.dart';
import 'package:pokedex_flutter/common/models/Pokedex.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({
    required this.dio,
  });

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsUrl);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados!');
    }
  }

  Future<List<Pokedex>> getBasePokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsBase);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json[''] as List<dynamic>;
      return list.map((e) => Pokedex.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados!');
    }
  }
}
