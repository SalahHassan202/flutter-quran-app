import 'package:flutter/material.dart';
import '../../data/models/surah_model.dart';

class SurahCard extends StatelessWidget {
  final SurahModel surah;
  final VoidCallback onTap;

  const SurahCard({super.key, required this.surah, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF0D3B66),
          child: Text(
            surah.number.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          surah.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("${surah.englishName} • ${surah.ayahsCount} آية"),
        onTap: onTap,
      ),
    );
  }
}
