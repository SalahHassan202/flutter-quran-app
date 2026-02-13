import 'package:dio/dio.dart';
import '../models/surah_model.dart';
import '../models/ayah_model.dart';

class QuranService {
  final Dio dio = Dio();

  Future<List<SurahModel>> getSurahs() async {
    final response = await dio.get("https://api.alquran.cloud/v1/surah");

    List data = response.data['data'];
    return data.map((e) => SurahModel.fromJson(e)).toList();
  }

  Future<List<AyahModel>> getSurahDetails(int number) async {
    final response = await dio.get(
      "https://api.alquran.cloud/v1/surah/$number",
    );

    List data = response.data['data']['ayahs'];
    return data.map((e) => AyahModel.fromJson(e)).toList();
  }
}
