

class Cats {
  String? file;

  Cats({this.file});

  Cats.fromJson(Map<String, dynamic> json) {
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['file'] = this.file;
    return data;
  }
}
