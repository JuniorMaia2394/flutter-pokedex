import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/errors/failure.dart';
import 'package:pokedex_flutter/common/models/Pokedex.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemonRepository.dart';
import 'package:pokedex_flutter/common/widgets/poError.dart';
import 'package:pokedex_flutter/common/widgets/poLoading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/detailsPage.dart';

class DetailArguments {
  final Pokemon pokemon;

  final int? index;

  DetailArguments({
    required this.pokemon,
    this.index = 0,
  });
}

class DetailContainer extends StatefulWidget {
  final IPokemonRepository repository;

  final DetailArguments arguments;
  final VoidCallback onBack;

  const DetailContainer({
    required this.repository,
    required this.arguments,
    required this.onBack,
  });

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (_pokemon == null) {
              _pokemon = widget.arguments.pokemon;
            }
            return DetailPage(
              pokemon: _pokemon!,
              list: snapshot.data!,
              onBack: widget.onBack,
              controller: _controller,
              onChangePokemon: (Pokemon value) {
                setState(() {
                  _pokemon = value;
                });
              },
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
