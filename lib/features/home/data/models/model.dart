import 'package:dio/dio.dart';

class Country {
  final String commonName;
  final String officialName;
  final String flagPng;
  final String flagSvg;
  final List<String> capital;
  final String region;
  final String subregion;
  final int population;
  final List<String> timezones;
  final List<Currency> currencies;
  final List<Language> languages;

  Country({
    required this.commonName,
    required this.officialName,
    required this.flagPng,
    required this.flagSvg,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.timezones,
    required this.currencies,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    final name = json['name'] ?? {};
    final capital =
        (json['capital'] as List?)?.map((e) => e.toString()).toList() ?? [];

    return Country(
      commonName: name['common'] ?? '',
      officialName: name['official'] ?? '',
      flagPng: json['flags']?['png'] ?? '',
      flagSvg: json['flags']?['svg'] ?? '',
      capital: capital,
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      population: json['population'] ?? 0,
      timezones:
          (json['timezones'] as List?)?.map((e) => e.toString()).toList() ?? [],
      currencies:
          (json['currencies'] as Map<String, dynamic>?)?.entries
              .map((e) => Currency.fromJson(e.value))
              .toList() ??
          [],
      languages:
          (json['languages'] as Map<String, dynamic>?)?.entries
              .map((e) => Language.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Currency {
  final String name;
  final String symbol;

  Currency({required this.name, required this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(name: json['name'] ?? '', symbol: json['symbol'] ?? '');
  }
}

class Language {
  final String code;
  final String name;

  Language({required this.code, required this.name});

  factory Language.fromJson(MapEntry<String, dynamic> entry) {
    return Language(code: entry.key, name: entry.value ?? '');
  }
}

class HttpClient {
  static Dio dio = Dio(BaseOptions(baseUrl: 'https://restcountries.com/v3.1'));
}

Future<List<Country>> getCountries() async {
  try {
    final response = await HttpClient.dio.get(
      '/all?fields=name,population,capital,flags,region',
    );
    print('Request URL: ${response.realUri}');
    print('Status Code: ${response.statusCode}');
    print('Raw Response: ${response.data}');
    final List data = response.data as List;
    return data.map((e) => Country.fromJson(e)).toList();
  } catch (e) {
    print("Error fetching countries: $e");
    return [];
  }
}
