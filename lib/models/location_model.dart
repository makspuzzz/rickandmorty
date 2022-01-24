
import 'package:flutter/foundation.dart';

class Locations{
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<dynamic> residents;

  Locations({
      required this.id,
    required this.name,
    required  this.type,
    required this.dimension,
    required  this.residents});

  factory Locations.fromJson(Map<String,dynamic> json){
    return Locations(
        id: json["id"],
        name:json['name'],
        type: json["type"],
        dimension: json["dimension"],
        residents: json["residents"]
    );
  }
}

