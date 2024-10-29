// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };
