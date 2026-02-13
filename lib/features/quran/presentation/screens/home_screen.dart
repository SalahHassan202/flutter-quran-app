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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "القرآن الكريم",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://wallpapersworld.org/wp-content/uploads/2023/06/%D8%B5%D9%88%D8%B1-%D8%AF%D9%8A%D9%86%D9%8A%D9%87-%D8%B1%D9%88%D8%B9%D8%A9-8.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                child: const Text(
                  "القرآن الكريم",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.menu_book),
              title: Text("السور"),
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

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.22,
                        width: double.infinity,
                        child: Image.network(
                          "https://pbs.twimg.com/media/DdePXKIVQAEPpfL.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),

                      Container(
                        height: size.height * 0.22,
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.1),
                      ),

                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "اقرأ وارتقِ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "ابدأ رحلتك مع كتاب الله",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: surahs.length,
                  itemBuilder: (context, index) {
                    return SurahCard(
                      surah: surahs[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                SurahDetailsScreen(surah: surahs[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
