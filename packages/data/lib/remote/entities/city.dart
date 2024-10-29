import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  int? id;
  String? name;
  @JsonKey(name: 'local_name')
  String? localName;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'country_id')
  int? countryId;
  Country? country;

  City({
    this.id,
    this.name,
    this.localName,
    this.createdAt,
    this.updatedAt,
    this.countryId,
    this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
