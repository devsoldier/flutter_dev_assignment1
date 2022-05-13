// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

PaginationDetails _$PaginationDetailsFromJson(Map<String, dynamic> json) =>
    PaginationDetails(
      page: json['page'] as int,
      per_page: json['per_page'] as int,
      total: json['total'] as int,
      total_pages: json['total_pages'] as int,
    );

Map<String, dynamic> _$PaginationDetailsToJson(PaginationDetails instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
    };
