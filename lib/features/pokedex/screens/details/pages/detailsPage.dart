import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Pokemon.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final List<Pokemon> list;

  DetailPage({
    required this.name,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: list
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.name,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
