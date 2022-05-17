// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationDetails<T> _$PaginationDetailsFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationDetails<T>(
      page: json['page'] as int,
      per_page: json['per_page'] as int,
      total: json['total'] as int,
      total_pages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PaginationDetailsToJson<T>(
  PaginationDetails<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data.map(toJsonT).toList(),
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: json['id'] as int,
      email: json['email'] as String,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fname': instance.fname,
      'lname': instance.lname,
      'avatar': instance.avatar,
    };

ResourceDetails _$ResourceDetailsFromJson(Map<String, dynamic> json) =>
    ResourceDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      year: json['year'] as int,
      color: json['color'] as String,
      pantone: json['pantone'] as String,
    );

Map<String, dynamic> _$ResourceDetailsToJson(ResourceDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantone': instance.pantone,
    };
