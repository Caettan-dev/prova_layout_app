
import 'package:flutter/material.dart';

class BlocoEstatistica extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String legenda;
  final Color cor;

  const BlocoEstatistica({
    super.key,
    required this.icone,
    required this.valor,
    required this.legenda,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cor,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              color: const Color(0xFF009688),
              size: 32,
            ),
            const SizedBox(height: 10),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              legenda,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

