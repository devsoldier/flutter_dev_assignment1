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

  @override
  String toString() => '$id, $email,$fname,$lname,$avatar';
}

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

  @override
  String toString() => '$id, $name,$year,$color,$pantone';
}

class BookDetails {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;

  BookDetails(
      {required this.page,
      required this.per_page,
      required this.total,
      required this.total_pages});

  @override
  String toString() => '$page, $per_page,$total,$total_pages';
}
