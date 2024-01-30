
class Membermodel {
  Map member;

  Membermodel({required this.member});

  factory Membermodel.fromJson(Map<String, dynamic> json) {
    return Membermodel(
      member: json,
    );
  }
}

class Modeldatas {
  Map datas;

  Modeldatas({required this.datas});

  factory Modeldatas.fromJson(Map<String, dynamic> json) {
    return Modeldatas(
      datas: json,
    );
  }
}