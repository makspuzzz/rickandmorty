

class Series{
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<dynamic> characters;

  Series({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters
  });

  factory Series.fromJson(Map<String,dynamic> json){

    return Series(
       id: json["id"],
        name:json['name'],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: json["characters"]
    );
  }
}