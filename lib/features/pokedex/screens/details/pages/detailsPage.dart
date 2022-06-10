import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detailsAppBarWidget.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detailsListWidget.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/widgets/typeWidget.dart';

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
                      child: Scaffold(
                        body: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBar(
                                indicatorColor: widget.pokemon.baseColor,
                                labelColor: Colors.black,
                                tabs: const [
                                  Tab(
                                    text: 'Sobre',
                                  ),
                                  Tab(
                                    text: 'Evolução',
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: TabBarView(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                            ),
                                            child: Text(
                                              'Altura: ${widget.pokemon.height}',
                                              style: GoogleFonts.kdamThmor(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Peso: ${widget.pokemon.weight}',
                                            style: GoogleFonts.kdamThmor(
                                              fontSize: 17.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tipo: ',
                                                  style: GoogleFonts.kdamThmor(
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10.0,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: widget
                                                        .pokemon.type
                                                        .map(
                                                          (e) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 2.0,
                                                            ),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  16.0,
                                                                ),
                                                                color: widget
                                                                    .pokemon
                                                                    .labelColor,
                                                              ),
                                                              height: 30,
                                                              width: 80,
                                                              child: Text(
                                                                e,
                                                                style: GoogleFonts
                                                                    .kdamThmor(
                                                                  color: widget
                                                                      .pokemon
                                                                      .baseColor,
                                                                  fontSize:
                                                                      14.5,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text('teste 2 '),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
