import 'package:flutter/material.dart';
import '../../data/services/quran_service.dart';
import '../../data/models/surah_model.dart';
import '../widgets/surah_card.dart';
import 'surah_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<SurahModel>> surahsFuture;

  @override
  void initState() {
    super.initState();
    surahsFuture = QuranService().getSurahs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("السور")),
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0D3B66)),
              child: Center(
                child: Text(
                  "القرآن الكريم",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<SurahModel>>(
        future: surahsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final surahs = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              return SurahCard(
                surah: surahs[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SurahDetailsScreen(surah: surahs[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
