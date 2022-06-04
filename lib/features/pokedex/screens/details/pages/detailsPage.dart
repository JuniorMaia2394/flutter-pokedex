import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokedex.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detailsAppBarWidget.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detailsListWidget.dart';

class DetailPage extends StatefulWidget {
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
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;
  bool isOnTop = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          DetailsAppBarWidget(
            pokemon: widget.pokemon,
            onBack: widget.onBack,
            isOnTop: isOnTop,
          ),
          DetailsListWidget(
            onChangePokemon: widget.onChangePokemon,
            pokemon: widget.pokemon,
            list: widget.list,
            controller: widget.controller,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    color: widget.pokemon.baseColor,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.favorite,
                                      color: widget.pokemon.baseColor),
                                  const Text(' Vida:'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.abc,
                                      color: widget.pokemon.baseColor),
                                  const Text(' Ataque:'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.shield,
                                      color: widget.pokemon.baseColor),
                                  const Text(' Defesa'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.favorite,
                                      color: widget.pokemon.baseColor),
                                  const Text(' Ataque especial:'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.favorite,
                                      color: widget.pokemon.baseColor),
                                  const Text(' Defesa especial:'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.run_circle_outlined,
                                      color: widget.pokemon.baseColor),
                                  const Text(' Velocidade:'),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
