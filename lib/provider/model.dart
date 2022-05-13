import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class UserDetails {
  final int id;
  final String email;
  final String fname;
  final String lname;
  final String avatar;

  UserDetails(
      {required this.id,
      required this.email,
      required this.fname,
      required this.lname,
      required this.avatar});

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  void clear() {}
}

@JsonSerializable()
class ResourceDetails {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantone;

  ResourceDetails(
      {required this.id,
      required this.name,
      required this.year,
      required this.color,
      required this.pantone});

  factory ResourceDetails.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDetailsToJson(this);
}

@JsonSerializable()
class PaginationDetails {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;

  PaginationDetails(
      {required this.page,
      required this.per_page,
      required this.total,
      required this.total_pages});

  factory PaginationDetails.fromJson(Map<String, dynamic> json) =>
      _$PaginationDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDetailsToJson(this);
}
