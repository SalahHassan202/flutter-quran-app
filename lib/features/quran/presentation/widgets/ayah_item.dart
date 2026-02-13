import 'package:flutter/material.dart';
import '../../data/models/ayah_model.dart';

class AyahItem extends StatelessWidget {
  final AyahModel ayah;

  const AyahItem({super.key, required this.ayah});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        textAlign: TextAlign.right,
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            height: 1.8,
          ),
          children: [
            TextSpan(text: ayah.text),
            TextSpan(
              text: " (${ayah.number})",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
