// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationDetails<T> {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<T> data;

  PaginationDetails({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
  });

  factory PaginationDetails.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationDetailsFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$PaginationDetailsToJson(this, toJsonT);
  @override
  String toString() => '$page, $per_page,$total,$total_pages,$data';
}

@JsonSerializable()
class UserDetails {
  final int id;
  final String email;
  final String fname;
  final String lname;
  final String avatar;

  UserDetails({
    required this.id,
    required this.email,
    required this.fname,
    required this.lname,
    required this.avatar,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  @override
  String toString() => '$id, $email,$fname,$lname,$avatar';
}

@JsonSerializable()
class ResourceDetails {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantone;

  ResourceDetails({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantone,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDetailsToJson(this);

  @override
  String toString() => '$id, $name,$year,$color,$pantone';
}
