import 'package:flutter/material.dart';

class PoError extends StatelessWidget {
  final String? error;

  const PoError({
    this.error,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Erro durante a operação'),
      ),
    );
  }
}
