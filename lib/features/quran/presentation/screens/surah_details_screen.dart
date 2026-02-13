import 'package:flutter/material.dart';
import '../../data/models/surah_model.dart';
import '../../data/services/quran_service.dart';
import '../../data/models/ayah_model.dart';
import '../widgets/ayah_item.dart';

class SurahDetailsScreen extends StatefulWidget {
  final SurahModel surah;

  const SurahDetailsScreen({super.key, required this.surah});

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  late Future<List<AyahModel>> ayahsFuture;

  @override
  void initState() {
    super.initState();
    ayahsFuture = QuranService().getSurahDetails(widget.surah.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.surah.name)),
      body: FutureBuilder<List<AyahModel>>(
        future: ayahsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final ayahs = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              return AyahItem(ayah: ayahs[index]);
            },
          );
        },
      ),
    );
  }
}
