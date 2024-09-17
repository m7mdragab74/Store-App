class Usermodel {
  final int id;
  final String email;
  final String password;
  final String firstname;
  final String lastname;

  Usermodel(
      {required this.id,
      required this.email,
      required this.password,
      required this.firstname,
      required this.lastname});
  factory Usermodel.fromjson(Map<String, dynamic> json) {
    return Usermodel(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        firstname: json['name']['firstname'],
        lastname: json['name']['lastname']);
  }
}
