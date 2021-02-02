class UserLogin {
  final String name;
  final String idLogin; 

  UserLogin({
    this.name, 
    this.idLogin
  });

  @override
  String toString() {
    return '$name, $idLogin';
  }
}