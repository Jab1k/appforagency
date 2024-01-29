
class Membermodel {
  Map member;

  Membermodel({required this.member});

  factory Membermodel.fromJson(Map<String, dynamic> json) {
    return Membermodel(
      member: json,
    );
  }
}
