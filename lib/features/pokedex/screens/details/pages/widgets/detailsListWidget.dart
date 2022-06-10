import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detailsItemListWidget.dart';

class DetailsListWidget extends StatefulWidget {
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
  State<DetailsListWidget> createState() => _DetailsListWidgetState();
}

class _DetailsListWidgetState extends State<DetailsListWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: widget.pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      widget.pokemon.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${widget.pokemon.num}',
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
                left: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.pokemon.type
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            color: widget.pokemon.labelColor,
                          ),
                          height: 25,
                          width: 80,
                          child: Text(
                            e,
                            style: GoogleFonts.kdamThmor(
                              color: widget.pokemon.baseColor,
                              fontSize: 14.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) =>
                    widget.onChangePokemon(widget.list[index]),
                controller: widget.controller,
                children: widget.list.map(
                  (e) {
                    bool diff = e.name != widget.pokemon.name;
                    return DetailsItemListWidget(
                      isDiff: diff,
                      pokemon: e,
                    );
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
